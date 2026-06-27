type Ring a = [a] --alias
-- newtype Ring a = [a] <-- nije alias, zabranjuje implicitnu konverziju

fromList :: [a] -> Ring a
fromList = id

toList :: Ring a -> [a]
toList = id

openWindow :: a -> Ring a -> Ring a
openWindow newWindow windows = newWindow:windows

closeWindow :: Ring a -> Ring a
closeWindow [] = []
closeWindow (_:windows) = windows;

switchActive :: Ring a -> Ring a
switchActive [] = []
switchActive [a] = [a]
switchActive (active:next:others) = next:active:others

focusNext :: Ring a -> Ring a
focusNext [] = []
focusNext (a:windows) = windows ++ [a]

focusPrev :: Ring a -> Ring a
focusPrev [] = []
focusPrev windows = reverse (focusNext (reverse windows))
