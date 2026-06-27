newtype Ring a = MkRing [a]

fromList :: [a] -> Ring a
fromList = MkRing

toList :: Ring a -> [a]
toList (MkRing windows) = windows

openWindow :: a -> Ring a -> Ring a
openWindow window (MkRing windows) = MkRing(window:windows)

closeWindow :: Ring a -> Ring a
closeWindow ring@(MkRing []) = ring
closeWindow (MkRing windows) = MkRing (tail windows)

switchActive :: Ring a -> Ring a
switchActive ring@(MkRing []) = ring
switchActive ring@(MkRing [window]) = ring
switchActive (MkRing (active:next:others)) = MkRing (next:active:others)

focusNext :: Ring a -> Ring a
focusNext ring@(MkRing []) = ring
focusNext (MkRing (a:windows)) = MkRing(windows ++ [a])

focusPrev :: Ring a -> Ring a
focusPrev ring@(MkRing []) = ring
focusPrev' (MkRing windows) = MkRing (reverse (toList (focusNext (MkRing (reverse windows)))))
