import System.Environment

main :: IO ()
main = do
    args <- getArgs
    let fileName = head args
    putStrLn $ "Attempting to read file: " ++ fileName
    fileContents <- readFile fileName
    putStrLn fileContents
