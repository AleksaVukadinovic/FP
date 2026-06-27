data Ring a = MkRing [a] [a] deriving Show-- algebarski tip

fromList :: [a] -> Ring a
fromList windows = MkRing windows []

toList :: Ring a -> [a]
toList (MkRing leftWindows rightWindows) = leftWindows ++ reverse rightWindows;

openWindow :: a -> Ring a -> Ring a
openWindow window (MkRing lw rw) = MkRing (window:lw) rw

closeWindow :: Ring a -> Ring a
closeWindow (MkRing [] []) = MkRing [] []
closeWindow (MkRing [w] rw) = MkRing (reverse rw) []
closeWindow (MkRing (_:lw) rw) = MkRing lw rw

switchActive :: Ring a -> Ring a
switchActive (MkRing [] []) = MkRing [] []
switchActive (MkRing [window] []) = MkRing [window] []
switchActive (MkRing [window] rw) = switchActive (MkRing (window : reverse rw) [])
switchActive (MkRing (active:next:others) rw) = MkRing (next:active:others) rw

focusNext :: Ring a -> Ring a
focusNext (MkRing [] []) = MkRing [] []
focusNext (MkRing [w] rw) = focusNext (MkRing (w : reverse rw) [])
focusNext (MkRing (window:lw) rw) = MkRing lw (window:rw)

focusPrev :: Ring a -> Ring a
focusPrev (MkRing lw []) = focusPrev(MkRing [] (reverse lw))
focusPrev (MkRing lw (r:rw)) = MkRing (r:lw) rw
