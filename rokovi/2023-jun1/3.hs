import System.Environment
import Data.Char (toLower)
import Data.List

getLineNumbers :: [(Int, String)] -> String -> [Int]
getLineNumbers numeratedList word = map fst (filter (\(num, line) -> elem (sort word) (map sort (words line)) ) numeratedList)

main :: IO ()
main = do
    args <- getArgs
    fileContent <- readFile (head args)
    let word = map toLower (args !! 1)
    let text = map toLower fileContent
    let textInLines = lines text
    let enumeratedText = zip [1..] textInLines
    let nums = getLineNumbers enumeratedText word
    mapM_ print nums
