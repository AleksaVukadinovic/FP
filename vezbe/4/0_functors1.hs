import Prelude hiding (Maybe, Nothing, Just, Either, Left, Right)
import qualified Data.Char as Ch

data Maybe a = Nothing
               | Just a
               deriving Show

instance Functor Maybe where
    fmap f Nothing  = Nothing
    fmap f (Just x) = Just (f x) -- fmap je uopstenje mapa. map radi smao na listama

stringToUpper :: String -> String
stringToUpper s = fmap Ch.toUpper s

stringToLower :: String -> String
stringToLower = fmap Ch.toLower

makeBold :: String -> String
makeBold s = "<b>" ++ s ++ "<b>"

formattedUserName :: Maybe String -> Maybe String
formattedUserName username = fmap makeBold $ fmap stringToUpper username

formattedUserName' :: Maybe String -> Maybe String
formattedUserName' = (fmap makeBold) . (fmap stringToUpper)


data Either a b = Left a
                | Right b
                deriving (Show, Eq)

type StrErr a = Either String a

instance Functor (Either a) where
    fmap f (Left x) = Left x
    fmap f (Right x) = Right (f x)

-- instance Functor ((->) r) where
--     fmap f g = (.)
