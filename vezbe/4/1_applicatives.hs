-- <*>, obmotava i cuva kontekst
-- pure umotava vrednosti
-- (pure 4) :: Maybe Int
-- (pure 4) :: []

instance Applicative Maybe where
    pure = Just

    (<*>) Nothing _ = Nothing
    (<*>) _ Nothing = Nothing
    (<*>) (Just f) (Just x) = Just (f x)

instance Applicative [] where
    pure x = [x]
    fs <*> xs = [f x | f <- fs, x <- xs]
