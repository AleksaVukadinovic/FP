import System.Environment
import Data.List (maximumBy)
import Data.Ord (comparing)

longestWord :: [String] -> String
longestWord words = maximumBy (comparing length) words

main :: IO()
main = do
    args <- getArgs
    fileContents <- mapM readFile args
    let allText = concat fileContents
    let allLines = lines allText
    let longestWords = map (longestWord . words) allLines
    print longestWords
