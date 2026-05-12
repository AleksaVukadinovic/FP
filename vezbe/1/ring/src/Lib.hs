module Lib where

newtype Ring w = MkRing [w]

fromList :: [w] -> Ring w
fromList = MkRing

toList :: Ring w -> [w]
toList (MkRing ws) = ws

openWindow :: w -> Ring w -> Ring w
openWindow w (MkRing ws) = MkRing (w:ws)

closeWindow :: Ring w -> Ring w
closeWindow ring@(MkRing []) = ring
closeWindow (MkRing ws) = MkRing $ tail ws

-- alt  + tab
switchActive :: Ring w -> Ring w
switchActive ring@(MkRing [])  = ring
switchActive ring@(MkRing [_]) = ring
switchActive (MkRing (active : next : ws)) = MkRing (next : active : ws)

-- multiple alt + tab
focusNext :: Ring w -> Ring w
focusNext ring@(MkRing []) = ring
focusNext (MkRing (w : ws)) = MkRing (ws ++ [w])

-- multiple shift + alt + tab
focusPrevious :: Ring w -> Ring w
focusPrevious (MkRing ws) = MkRing (reverse . focusNext' . reverse $ ws)
  where
    focusNext' []      = []
    focusNext' (x: xs) = xs ++ [x]
