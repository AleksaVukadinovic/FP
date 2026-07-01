newtype ZList a = ZList {getList :: [a]}

instance Show a => Show (ZList a) where
    show (ZList xs) = "[<" ++ inner xs ++ ">]"
        where inner [] = ""
              inner [y] = show y
              inner (y:ys) = show y ++ ", " ++ inner ys

instance Functor ZList where
    fmap f (ZList xs) = ZList $ map f xs

instance Applicative ZList where
    pure x = ZList [x]
    ZList fs <*> ZList xs = ZList [f x | f <- fs, x <-xs]

instance Monad ZList where
    ZList xs >>= f = ZList (concat [ getList (f x) | x <- xs ])
