import Data.Char

mySum :: Num a => [a] -> a
mySum lst = if null lst then 0 else head lst + mySum (tail lst)

mySum2 :: Num a => [a] -> a
mySum2 [] = 0
mySum2 lst = (head lst) + (mySum (tail lst))

-- ova implementacija gomila stack framove - LOSE!
mySum3 :: Num a => [a] -> a
mySum3 [] = 0
mySum3 (x:xs) = x + mySum xs

-- unapredjnje prethodne implemnetacije preko repne rekurzije
mySumRepnaRekurzija :: Num a => [a] -> a
mySumRepnaRekurzija xs = mySumHelper 0 xs
    where mySumHelper accumlator values = case values of
                                          [] -> accumlator
                                          (x:xs) -> mySumHelper (accumlator + x) xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = [] -- _ je neimenovan parametar, posto nas fja ne zanima u ovom slucaju
myFilter f (x:xs) =
    let filteredTail = myFilter f xs
        in if f x then x:filteredTail else filteredTail
        -- problem: opet nemamo repnu rekurziju

-- jeste repna, ali ispusuje u nazad
myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' _ [] = []
myFilter' f xs = myFilterHelper [] xs -- umesto xs napisemo (reverse xs)
    where myFilterHelper accumulator values = case values of
                                                [] -> accumulator
                                                (x:xs) -> myFilterHelper (if f x then x:accumulator else accumulator) xs

mySum4 xs = foldl (\acc x -> acc + x) 0 xs

mySum5 :: Num a => [a] -> a
mySum5 = foldl (+) 0

mySum6 :: Num a => [a] -> a
mySum6 = foldl1 (+)

myFilter2 :: (a -> Bool) -> [a] -> [a]
myFilter2 f = foldr (\x acc -> if f x then x:acc else acc) []

myConcat :: [a] -> [a] -> [a]
myConcat leftList rightList = foldr (:) rightList leftList

takeFirstWord :: String -> String
takeFirstWord sentence = takeWhile (not . isSpace) sentence

-- ignorise beline na pocetu
takeFirstWord2 :: String -> String
takeFirstWord2 sentence = takeWhile (not . isSpace) (dropWhile isSpace sentence)

filterByIndex f xs =
    let withIndexes xs = zip [1..] xs
        indexed = withIndexes xs
        pairpred = f . fst
    in map snd $ filter pairpred indexed
