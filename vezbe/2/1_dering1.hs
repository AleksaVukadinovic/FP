type Ring a = ([a], [a])

fromList :: [a] -> Ring a
fromList windows = (windows, [])

toList :: Ring a -> [a]
toList (leftWindows, rightWindows) = leftWindows ++ reverse rightWindows;

openWindow :: a -> Ring a -> Ring a
openWindow window (lw, rw) = (window:lw, rw)

closeWindow :: Ring a -> Ring a
closeWindow ([], []) = ([], [])
closeWindow ([w], rw) = (reverse rw, [])
closeWindow (_:lw, rw) =(lw, rw)

switchActive :: Ring a -> Ring a
switchActive ([], []) = ([], [])
switchActive([window], []) = ([window], [])
switchActive([window], rw) = switchActive (window : reverse rw, [])
switchActive (active:next:others, rw) = (next:active:others, rw)

focusNext :: Ring a -> Ring a
focusNext ([], []) = ([], [])
focusNext ([w], rw) = focusNext (w : reverse rw, [])
focusNext (window:lw, rw) = (lw, window:rw)

focusPrev :: Ring a -> Ring a
focusPrev (lw, []) = focusPrev([], reverse lw)
focusPrev (lw, r:rw) = (r:lw, rw)
