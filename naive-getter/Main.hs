module Main where

import qualified Data.ByteString.Lazy as LBS
import           Data.Serialize
import           Data.Serialize.IEEE754
import qualified Data.Vector as V
import           Lib

main :: IO ()
main = do
  dat <- LBS.readFile "output.dat"
  let len = V.length vec
  let total = V.sum vec
  case len `seq` total `seq` runGetLazy (V.replicateM len getFloat32le) dat of
    Left e  -> error e
    Right v -> print (total == V.sum v)
