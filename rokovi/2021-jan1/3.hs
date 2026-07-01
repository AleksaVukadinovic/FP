data Tree a = Empty
            | MkTree { value :: a,
                       left :: Tree a,
                       right :: Tree a}

addToTree :: Ord a => Tree a -> a -> Tree a
addToTree Empty x = MkTree x Empty Empty
addToTree (MkTree v l r) x
    | x < v     = MkTree v (addToTree l x) r
    | otherwise = MkTree v l (addToTree r x)

fromList :: Ord a => [a] -> Tree a
fromList [] = Empty
fromList list = foldl addToTree Empty list

toList :: Tree a -> [a]
toList Empty = []
toList t = toList (left t) ++ [value t] ++ toList (right t)

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f (MkTree v l r) = MkTree (f v) (treeMap f l) (treeMap f r)

instance Eq a => Eq (Tree a) where
    Empty == Empty = True
    (MkTree v1 l1 r1) == (MkTree v2 l2 r2) =
        v1 == v2 && l1 == l2 && r1 == r2

instance Show a => Show (Tree a) where
    show t = show (toList t)

instance Functor Tree where
    fmap = treeMap
