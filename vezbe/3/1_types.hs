-- Tipovi

type Ring1 a = [a] -- samo alias, ne forsira tipove
newtype Ring2 a = MkRing2 [a] -- zaista generise novi tip, optimozvan (brzi od data) je ali konstruktor mora da ima tacno jedan argument
data Ring3 a = MkRing3 {left :: [a], right :: [a]} -- algebarski tip, nema ogranicenja za broj tipova, ima gettere

-- Deriving

data Pet = MkPet {
                regId   :: Int,
                name    :: String,
                age     :: Int,
                height  :: Float,
                weight  :: Float
} deriving (Show, Eq)

-- Klase

data Circle = MkCircle { r :: Float}
data Rectangle = MkRectangle { a :: Float, b :: Float}

class Shape a where
    area            :: a -> Float
    circumfrance    :: a -> Float

instance Shape Circle where
    area            x = r' * r' * pi where r' = r x
    circumfrance    x = 2 * r' * pi where r' = r x

instance Shape Rectangle where
    area            x = (a x) * (b x)
    circumfrance    x = 2 * (a x + b x)

instance Eq Circle where
    (==) c1 c2 = r c1 == r c2

instance Eq Rectangle where
    r1 == r2 = a r1 == a r2 && b r1 == b r2
    -- TODO: flipped rectangle

instance Show Circle where
    show x = "(r=" ++ show (r x) ++ ")"
