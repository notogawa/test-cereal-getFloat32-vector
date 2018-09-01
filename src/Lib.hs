module Lib ( vec ) where

import qualified Data.Vector as V

vec :: V.Vector Float
vec = V.fromListN (1024 * 256 * 7 * 7) [0,0.1..]
