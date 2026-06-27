-- Implementiramo:
-- openWindow
-- closeWindow
-- switchActive (alt-tab)
-- focusNext (vise alt-tab)
-- focusPrev (shift-alt-tab)

openWindow :: window -> [window] -> [window]
openWindow newWindow windows = newWindow:windows

closeWindow :: [window] -> [window]
closeWindow [] = []
closeWindow (_:windows) = windows;
-- closeWindow = tail <-- moze i ovako

switchActive :: [window] -> [window]
switchActive [] = []
switchActive [window] = [window]
switchActive (active:next:others) = next:active:others

focusNext :: [window] -> [window]
focusNext [] = []
focusNext (window:windows) = windows ++ [window]

focusPrev :: [window] -> [window]
focusPrev [] = []
focusPrev windows = reverse (focusNext (reverse windows))
-- focusPrev windows = reverse $ focusNext $ reverse windows <-- $ menja asocijativnost
-- focusPrev windows = (reverse . focusNext . reverse) windows
-- focusPrev = reverse . focusNext . reverse
