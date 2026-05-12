import Lib
import Lib (focusNext)

main :: IO ()
main = putStrLn "Test suite not yet implemented"

prop_conversion lst =
    lst == toList (fromList lst)
    where types = lst :: [Int]

prop_fp_fn lst =
    lst == toList(focusNext(focusPrev(fromList lst)))
    where types = lst :: [Int]

prop_fn_fp lst =
    lst == toList(focusPrev(focusNext(fromList lst)))
    where types = lst :: [Int]
