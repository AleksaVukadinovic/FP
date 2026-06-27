class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno Nothing = False
    yesno _ = True

---------------------------------

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf cond thenExpr elseExpr = if yesno cond then thenExpr else elseExpr
