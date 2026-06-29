main :: IO ()
main = do
    line <- getLine
    putStrLn line
    putStrLn line
    putStrLn line
    putStrLn line
    putStrLn line
    putStrLn line
-- moze i do {line <- getLine; putStrLn line; .. ; .. ; ...}

foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

getLine :: IO String
-- getLine >>= (\line -> putStrLn line >> putStrLn line >> putStrLn line)
