newtype ProbabilityList a = MkProbabilityList {getList :: [(a, Double)]}
    deriving (Show, Eq)

instance Functor ProbabilityList where
    fmap f (MkProbabilityList list) = MkProbabilityList (map (\(x, p) -> (f x, p)) list)

instance Applicative ProbabilityList where
    pure a = MkProbabilityList [(a, 1)]
    MkProbabilityList list1 <*> MkProbabilityList list2 = MkProbabilityList [(v1 v2, p1 * p2) | (v1, p1) <-list1, (v2, p2) <-list2]

instance Monad ProbabilityList where
    MkProbabilityList list >>= f = MkProbabilityList (concat [ [ (w, p * q) | (w, q) <- getList (f v) ] | (v, p) <- list ])

flattenProbList :: ProbabilityList (ProbabilityList a) -> ProbabilityList a
flattenProbList nestedList = MkProbabilityList ( foldl reduceFunction [] (getList nestedList))

reduceFunction :: [(a, Double)] -> (ProbabilityList a, Double) -> [(a, Double)]
reduceFunction acc (innerList, outerProb) =
    let
        innerPairs = getList innerList
        multipliedPairs = [(x, innerProb * outerProb) | (x, innerProb) <- innerPairs]
    in
        acc ++ multipliedPairs

groupProbabilities :: Eq a => ProbabilityList a -> ProbabilityList a
groupProbabilities (MkProbabilityList pairs) = MkProbabilityList (helper pairs)
    where
    helper [] = []
    helper ((x, p) : rest) =
        let total = p + sum [ q   | (y, q) <- rest, y == x ]
            rest' =         [ pr  | pr@(y, _) <- rest, y /= x ]
        in (x, total) : rest'

data Coin = Head | Tails
    deriving (Show, Eq)

flipCoin :: ProbabilityList Coin
flipCoin = MkProbabilityList [(Head, 0.5), (Tails, 0.5)]

simulateThreeCoinThrows :: ProbabilityList (Coin, Coin, Coin)
simulateThreeCoinThrows = do
    a <- flipCoin
    b <- flipCoin
    c <- flipCoin
    return (a, b, c)
