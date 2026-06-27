import Lib
import Test.QuickCheck

main :: IO ()
main = putStrLn "Testiranje :D"

prop_conversions lst =
    lst == (toList $ fromList lst)
    where types = (lst :: [Int])

prop_fp_fn lst =
    lst == (toList $ focusNext $ focusPrev $ fromList lst)
    where types = (lst :: [Int])

-- prop_fn_fp lst =
--     lst == (toList $ focusNext $ focusPrev $ fromList lst)
--     where types = (lst :: [Int])
