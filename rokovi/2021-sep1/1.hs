data Prozor a = MkProzor {
    identifikator :: Int,
    naziv :: String,
    sadrzaj :: a
}

instance Eq (Prozor a) where
    (==) p1 p2 = identifikator p1 == identifikator p2

instance Ord (Prozor a) where
    (<=) p1 p2 = identifikator p1 <= identifikator p2

instance Functor Prozor where
    fmap f (MkProzor id n s) = MkProzor id n (f s)

instance Applicative Prozor where
    pure = MkProzor 0 ""
    (MkProzor _ _ f) <*> (MkProzor id n s) = MkProzor id n (f s)

instance Monad Prozor where
    (MkProzor id n s) >>= f = f s
