-- Napraviti klasu Takeable t sa funkcijom takeSome :: Int -> t a -> [a].
-- Instancirati za listu, stablo i Maybe.

data Tree a = Empty
            | MkTree { value :: a, left :: Tree a, right :: Tree a }
            deriving (Eq)

toList :: Tree a -> [a]
toList Empty = []
toList (MkTree v l r) = toList l ++ [v] ++ toList r

class Takeable t where
    takeSome :: Int -> t a -> [a]

instance Takeable [] where
    takeSome n t = take n t

instance Takeable Maybe where
    takeSome _ Nothing = []
    takeSome n (Just x) = take n [x]

instance Takeable Tree where
    takeSome n t = take n (toList t)
