module Main where

import           Data.Char
import qualified Data.Map           as Map
import           Ngrams
import           System.Environment
import           System.IO

filterArgPrefix = "--filter"
textFilters = Map.fromList
              [ ("Digit",       not . isDigit)
              , ("Punctuation", not . isPunctuation)
              , ("Symbol",      not . isSymbol)
              ]

main :: IO ()
main = do
    (fileName:nStr:args) <- getArgs
    text <- readFile fileName
    let n = read nStr
    mapM_ print $ ngrams n text
    return ()

