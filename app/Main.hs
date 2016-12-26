module Main where

import System.IO
import System.Environment
import Data.Char
import Ngrams
import qualified TextUtils as Txt

main :: IO ()
main = do
    (fileName:args) <- getArgs
    text <- readFile fileName
    mapM putStrLn $ getDigrams text
    return ()

getDigrams = getNgrams 2 . Txt.getWords . Txt.toLower
