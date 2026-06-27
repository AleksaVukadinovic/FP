
infixr 7 :/:
data MyList a = End
              | (:/:) a (MyList a)

instance Show a => Show (MyList a) where
    show End = ""
    show (x :/: End) = show x
    show (x :/: xs) = show x ++ ", " ++ show xs

show' :: Show a => MyList a -> String
show' End = ""
show' (x :/: End) = show x
show' (x :/: xs) = show x ++ " " ++ show xs
