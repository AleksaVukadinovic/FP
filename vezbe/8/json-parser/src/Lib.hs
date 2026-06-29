module Lib where
import Control.Applicative
import Data.Char

-- JSON AST
data JsonValue = JsonNull
               | JsonBool Bool
               | JsonNumber Integer
               | JsonString String
               | JsonArray [JsonValue]
               | JsonObject [(String, JsonValue)]
               deriving (Show, Eq)

-- Parser

newtype Parser a = Parser {runParser :: String -> Maybe (String, a)}

instance Functor Parser where
    fmap f (Parser p) = Parser $ \input -> do
                                    (input', x) <- p input
                                    Just (input', f x)

instance Applicative Parser where
    pure x = Parser $ \input -> Just (input, x)
    (Parser p1) <*> (Parser p2) = Parser $ \input -> do
                                                    (input', f) <- p1 input
                                                    (input'', x) <- p2 input'
                                                    Just (input'', f x)

instance Alternative Parser where
    empty = Parser $ \_ -> Nothing
    (Parser p1) <|> (Parser p2) = Parser $ \input -> p1 input <|> p2 input

charParser :: Char -> Parser Char
charParser c = Parser f
    where f (x:xs)
            | x == c = Just (xs, x)
            | otherwise = Nothing
          f [] = Nothing

stringParser :: String -> Parser String
stringParser input = sequenceA $ map charParser input

jsonNull :: Parser JsonValue
jsonNull = (\_ -> JsonNull) <$> stringParser "null"

jsonBool :: Parser JsonValue
jsonBool = fmap f $ stringParser "true" <|> stringParser "false"
    where f "true" = JsonBool True
          f "false" = JsonBool False
          f _ = undefined

spanParser :: (Char -> Bool) -> Parser String
spanParser f = Parser $ \input -> let (token, rest) = span f input
                                    in Just (rest, token)

notNull :: Parser [a] -> Parser [a]
notNull (Parser p) = Parser $ \input -> do
                                (input', xs) <- p input
                                if null xs  then Nothing
                                            else Just (input', xs)

jsonNumber :: Parser JsonValue
jsonNumber = fmap f $ notNull $ spanParser isDigit
    where f ds = JsonNumber $ read ds

stringLiteral :: Parser String
stringLiteral = charParser '"' *> spanParser (/= '"') <* charParser '"'

jsonString :: Parser JsonValue
jsonString = fmap JsonString stringLiteral

whiteSpace :: Parser String
whiteSpace = spanParser isSpace

separateBy :: Parser a -> Parser b -> Parser [b]
separateBy separator element = (:) <$> element <*> many (separator *> element) <|> pure []

jsonArray :: Parser JsonValue
jsonArray = fmap JsonArray $ charParser '[' *> whiteSpace *> elements <* whiteSpace <* charParser ']'
    where elements = separateBy separator jsonValue
          separator = whiteSpace *> charParser ',' <* whiteSpace

jsonObject :: Parser JsonValue
jsonObject = fmap JsonObject $ charParser '{' *> whiteSpace *> pairs <* whiteSpace <* charParser '}'
    where pairs = separateBy separator pair
          separator = whiteSpace *> charParser ',' <* whiteSpace
          pair = (\key value -> (key, value))
                    <$> (stringLiteral <* whiteSpace <* charParser ':' <* whiteSpace)
                    <*> jsonValue

jsonValue :: Parser JsonValue
jsonValue = jsonNull <|> jsonBool <|> jsonNumber <|> jsonString <|> jsonArray <|> jsonObject

-- | Parse a complete JSON document, allowing surrounding whitespace.
--   Returns Nothing if the input is not valid JSON or has leftover input.
parseJson :: String -> Maybe JsonValue
parseJson input = case runParser (whiteSpace *> jsonValue <* whiteSpace) input of
    Just ("", value) -> Just value
    _                -> Nothing
