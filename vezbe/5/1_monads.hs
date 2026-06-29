type Birds = Int
type Pole = (Birds, Birds)

landLeft' :: Birds -> Pole -> Pole
landLeft' n (left, right) = (left + n, right)

landRight' :: Birds -> Pole -> Pole
landRight' n (left, right) = (left, right + n)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs (left + n - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (n + right)) < 4 = Just (left, right + n)
    | otherwise = Nothing

instance Monad Maybe where
    return = Just
    Nothing >>= f = Nothing
    Just x >>= f = f x

instance Monad [] where
    return x = [x]
    xs >>= f = concat $ map f xs
