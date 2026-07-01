import System.Environment
import Data.Char (toLower)
import Data.List

main :: IO ()
main = do
    args <- getArgs
    if length args > 0 then do
        contents <- mapM readFile args
        let allText = concat contents
        let sortedText = sort allText
        print sortedText
    else do
        text <- getLine
        let sortedText = sort text
        print sortedText
