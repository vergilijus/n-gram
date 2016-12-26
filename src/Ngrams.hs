module Ngrams
    ( getNgrams
    , getNgramsMap
    , getSortedNgramsList
    , ngrams
    ) where

import           Data.List
import           Data.Map  (Map)
import qualified Data.Map  as Map
import qualified TextUtils as Txt

getNgrams :: Int -> [String] -> [String]
getNgrams _ [] = []
getNgrams n words@(firsWord:otherWords)
    | length words < n  = []
    | otherwise         = getNgram words : getNgrams n otherWords
  where
    getNgram = unwords . take n

getNgramsMap :: Int -> [String] -> Map String Int
getNgramsMap n words = Map.fromListWith (+) wordsList
  where
    wordsList = zip ngrams [1,1..]
    ngrams = getNgrams n words

getSortedNgramsList :: (Ord v) => Map k v -> [(k, v)]
getSortedNgramsList = sortBy (\ (_, v1) (_, v2) -> v1 `compare` v2) . Map.toList

ngrams :: Int -> String -> [(String, Int)]
ngrams n = getSortedNgramsList . getNgramsMap n . Txt.getWords
