class Concatenatable t where
    concatenate :: t -> t -> t

-- Instancirati ovu klasu za liste, integere (pisati Integer a ne Int) (3 concatenate 2 = 32), uredjene parove ( (1, 2) concatenate (3, 4) = (13, 24)) i za Maybe

instance Concatenatable [a] where
    concatenate l1 l2 = l1 ++ l2

instance Concatenatable Integer where
    concatenate num1 num2 = num1 * 10 ^ length (show num2) + num2

instance (Concatenatable a, Concatenatable b) => Concatenatable (a, b) where
    concatenate (a1, b1) (a2, b2) = (concatenate a1 a2, concatenate b1 b2)

instance Concatenatable a => Concatenatable (Maybe a) where
    concatenate (Just x) (Just y) = Just (concatenate x y)
    concatenate Nothing (Just y) = Just y
    concatenate (Just x) Nothing = Just x
    concatenate Nothing Nothing = Nothing
