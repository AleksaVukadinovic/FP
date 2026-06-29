-- :i Num
-- {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}

instance Num a => Num [a] where
    -- sabiranje polinoma
    (x:xs) + (y:ys) = (x + y) : (xs + ys)
    xs + [] = xs
    [] + ys = ys

    -- mnozenje polinoma
    (x:xs) * (y:ys) = x*y :[x]*ys + xs*(y:ys)
    _ * _ = []

    abs = undefined
    signum = map signum
    fromInteger n = [fromInteger n]
    negate = map (\x -> -x)
