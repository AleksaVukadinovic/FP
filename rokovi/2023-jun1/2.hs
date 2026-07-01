class Rev a where
    rev :: a -> a

instance Rev Integer where
    rev x =
        if x < 0
            then (-1) * (read (reverse (show (x * (-1)))) :: Integer)
            else read (reverse (show x)) :: Integer

instance Rev [a] where
    rev = reverse

instance (Rev a, Rev b) => Rev (a, b) where
    rev (x, y) = (rev x, rev y)

prop_revRev :: [Int] -> Bool
prop_revRev xs = rev (rev xs) == xs
