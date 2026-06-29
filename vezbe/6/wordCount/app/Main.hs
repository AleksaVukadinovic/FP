import System.Environment
import qualified Data.Char as Char
import qualified Data.List as List
import qualified Data.Tuple as Tuple

main :: IO ()
main = do
    -- read n
    (arg:_) <- getArgs
    let n = read arg :: Int
    print n

    -- Load stdin
    text <- getContents

    -- Handle input
    putStrLn $ processInput text n

processInput :: String -> Int -> String
processInput text n =
    let ws = words
            $ map Char.toLower
            $ filter (\c -> Char.isLetter c || Char.isSpace c)
            $ text
        word_occs = map (\g -> (head g, length g)) $ List.group $ List.sort ws
        sorted = List.sortBy (flip compare) $ map Tuple.swap word_occs
    in unlines $ map show $ take n sorted
