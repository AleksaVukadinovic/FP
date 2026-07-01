-- Imena fajlova se daju kao argumenti komandne linije i učitava se reč sa stdin-a.
-- Prebrojati pojavljivanje te reči u fajlovima.

import System.Environment

main :: IO()
main = do
    args <- getArgs
    fileContents <- mapM readFile args
    key <- getLine
    let allText = concat fileContents
    let allWords = words allText
    let occurrences = filter (==key) allWords
    print (length occurrences)
