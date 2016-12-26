module TextUtils
    ( toLower
    , filterDigit
    , filterPunctuation
    , textFilter
    , getWords
    ) where

import qualified Data.Char as C

filterDigit :: String -> String
filterDigit = filter $ not . C.isDigit

filterPunctuation :: String -> String
filterPunctuation = filter $ not . C.isPunctuation

textFilter :: String -> String
textFilter = filterDigit . filterPunctuation

toLower :: String -> String
toLower = map C.toLower

getWords :: String -> [String]
getWords = words . textFilter

