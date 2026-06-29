data Maybe a = Nothing
             | Just a

instance Functor Maybe where
    fmap f Nothing = Nothing
    fmap f (Just x) = Just (f x)

instance Applicative Maybe where
    pure = Just

    Nothing <*> _ = Nothing
    _ <*> Nothing = Nothing
    (Just f) <*> (Just x) = Just (f x)

instance Alternative Maybe where
    empty = Nothing

    Nothing <|> r = r
          l <|> _ = l

makeItalic :: String -> String
makeItalic s = "<i>" ++ s ++ "</i>"

makeUnderlined :: Maybe String -> Maybe String
makeUnderlined Nothing = Nothing
makeUnderlined (Just s) = Just ("<u>" ++ s ++ "</u>")

makeBold :: String -> Maybe String
makeBold s = Just $ "<b>" ++ s ++ "</b>"

stringToUpper :: String -> MaybeString
stringToUpper s = Just $ fmap Data.Char.toUpper s
