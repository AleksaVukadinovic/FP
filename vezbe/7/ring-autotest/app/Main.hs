module Main where

import System.Environment

main :: IO ()
main = do
    args <- getArgs
    mapM_ process args

process :: String -> IO ()
process file = do
    contents <- readFile file
    let tests = getTests contents
    if null tests then putStrLn $ file ++ ": nothing to test"
                    else executeTest file


getTests :: ?
