module Lib where

import Data.Char

mySum1 :: (Num a) => [a] -> a
mySum1 lst = if null lst then 0 else (head lst) + (mySum1 (tail lst))

mySum2 :: (Num a) => [a] -> a
mySum2 [] = 0
mySum2 (x : xs) = x + (mySum2 xs)

mySum2' :: (Num a) => [a] -> a
mySum2' lst =
  let mySumHelper acc values = case values of
        [] -> acc
        (x : xs) -> mySumHelper (acc + x) xs
   in mySumHelper 0 lst

mySum :: (Num a) => [a] -> a
mySum = foldl (+) 0

mySum' :: (Num a) => [a] -> a
mySum' = foldl1 (+)

myConcat :: [a] -> [a] -> [a]
myConcat ls rs = foldr (:) rs ls

-- Uzima recenicu i vraca prvu rec recenice
takeWord :: String -> String
takeWord sentence = takeWhile (not . isSpace) (dropWhile isSpace sentence)

takeWord' :: String -> String
takeWord' =
  let isNotSpace = not . isSpace
   in takeWhile isNotSpace . dropWhile isSpace

filterByIndex p xs =
  let withIndices xs = zip [1 ..] xs
      indexed = withIndices xs
      pair_predicate = p . fst
   in map snd $ filter pair_predicate indexed
