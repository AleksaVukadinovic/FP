data Tree a = Empty
            | MkTree { value :: a
                     , left :: Tree a
                     , right :: Tree a
                     }
            deriving (Eq)

addToTree :: (Ord a) => Tree a -> a -> Tree a
addToTree Empty x = MkTree x Empty Empty
addToTree (MkTree v l r) x
  | x < v     = MkTree v (addToTree l x) r
  | otherwise = MkTree v l (addToTree r x)

fromList :: Ord a => [a] -> Tree a
fromList = foldl addToTree Empty

toList :: Tree a -> [a]
toList Empty = []
toList (MkTree v l r) = toList l ++ [v] ++ toList r

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f Empty = Empty
treeMap f (MkTree v l r) = MkTree (f v) (treeMap f l) (treeMap f r)

instance Show a => Show (Tree a) where
    show t = show $ toList t
