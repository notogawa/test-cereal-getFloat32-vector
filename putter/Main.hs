module Main where

import qualified Data.ByteString.Lazy as LBS
import           Data.Serialize
import           Data.Serialize.IEEE754
import           Lib

main :: IO ()
main = LBS.writeFile "output.dat" $ runPutLazy $ mapM_ putFloat32le vec
