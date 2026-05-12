module Main (main) where

import Lib

main :: IO ()
main = print (toList (focusNext (fromList [1, 2, 3 :: Int])))
