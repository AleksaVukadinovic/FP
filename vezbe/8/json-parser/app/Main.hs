module Main (main) where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    contents <- case args of
        (file:_) -> readFile file
        []       -> getContents
    case parseJson contents of
        Just value -> print value
        Nothing    -> putStrLn "Invalid JSON"
