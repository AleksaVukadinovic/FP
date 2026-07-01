import System.Environment

main :: IO()
main = do
    args <- getArgs
    fileContent <- readFile (head args)
    print(solveExpression fileContent)

solveExpression :: String -> Int
solveExpression expression = head $ foldl stepFunction [] (splitIntoTokens expression)

stepFunction :: [Int] -> String -> [Int]
stepFunction (a:b:others) "+" = (a + b) : others
stepFunction (a:b:others) "*" = (a * b) : others
stepFunction (a:b:others) "-" = (b - a) : others
stepFunction (a:b:others) "/" = (a `div` b) : others
stepFunction stack num = (read num :: Int) : stack

-- Helpers

splitIntoTokens :: String -> [String]
splitIntoTokens = words
