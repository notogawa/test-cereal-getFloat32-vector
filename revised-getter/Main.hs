module Main where

import qualified Data.ByteString.Lazy as LBS
import           Data.Serialize
import           Data.Serialize.IEEE754
import qualified Data.Vector as V
import           Lib

import           System.IO.Unsafe (unsafeDupablePerformIO)
import           Foreign.Marshal.Alloc (alloca)
import           Foreign.Storable (Storable, peek, poke)
import           Foreign.Ptr (castPtr)

main :: IO ()
main = do
  dat <- LBS.readFile "output.dat"
  let len = V.length vec
  let total = V.sum vec
  case len `seq` total `seq` runGetLazy (getFloat32leVector len) dat of
    Left e  -> error e
    Right v -> print (total == V.sum v)

getFloat32leVector :: Int -> Get (V.Vector Float)
getFloat32leVector n = do
  v <- V.replicateM n getWord32le
  return $ unsafeDupablePerformIO $ alloca $ \ptr -> do
    V.mapM (\x -> poke ptr x >> peek (castPtr ptr)) v
