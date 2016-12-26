module Ngrams
    ( getNgrams
    ) where

import Data.List
import TextUtils

getNgrams :: Int -> [String] -> [String]
getNgrams _ [] = []
getNgrams n words@(firsWord:otherWords)
    | length words < n  = []
    | otherwise         = (getNgram words) : (getNgrams n otherWords)
  where
    getNgram = intercalate " " . take n
