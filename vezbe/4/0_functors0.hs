data MyMaybe a = MyNothing
               | MyJust a
               deriving Show

instance Functor MyMaybe where
    fmap f MyNothing  = MyNothing
    fmap f (MyJust x) = MyJust (f x) -- fmap je uopstenje mapa. map radi smao na listama

-- fmap (+3) (MyJust 3)
-- 3 <$ (Just "b")
--
--
