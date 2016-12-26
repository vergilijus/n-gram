module Main where

import           Data.Char
import           Ngrams
import           System.Environment
import           System.IO

main :: IO ()
main = do
    (fileName:nStr:args) <- getArgs
    text <- readFile fileName
    let n = read nStr
    mapM_ print $ ngrams n text
    return ()

