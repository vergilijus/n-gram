module Ngrams
    ( getNgrams
    , getNgramsMap
    , ngrams
    ) where

import           Data.Char
import           Data.List
import           Data.Map  (Map)
import qualified Data.Map  as Map
import           Data.Ord

type Ngram a = ([a], Int)

getNgrams :: Int -> [a] -> [[a]]
getNgrams _ [] = []
getNgrams n xs@(_:suffix)
    | length xs < n = []
    | otherwise     = take n xs : getNgrams n suffix

getNgramsMap :: (Ord a) => Int -> [a] -> Map [a] Int
getNgramsMap n xs = Map.fromListWith (+) wordsList
  where
    wordsList = zip ngrams [1,1..]
    ngrams = getNgrams n xs

ngrams :: (Ord a) => Int -> [a] -> [Ngram a]
ngrams n = sortBy (comparing snd) . Map.toList . getNgramsMap n

