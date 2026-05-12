module Lib  (
            fromList,
            toList,
            focusNext,
            focusPrev,
            closeWindow,
            openWindow
            ) where

data Ring a = MkRing [a] [a] deriving Show

fromList :: [a] -> Ring a
fromList ws = MkRing ws []

toList :: Ring a -> [a]
toList (MkRing leftList rightList) = leftList ++ reverse rightList

openWindow :: a -> Ring a -> Ring a
openWindow new (MkRing leftList rightList) = MkRing (new:leftList) rightList

closeWindow :: Ring a -> Ring a
closeWindow ring@(MkRing [] []) = ring
closeWindow (MkRing [one] rightList) = MkRing (reverse rightList) []
closeWindow (MkRing (active:leftList) rightList) = MkRing leftList rightList

switchActive :: Ring a -> Ring a
switchActive ring@(MkRing [] []) = ring
switchActive (MkRing [one] []) = MkRing [one] []
switchActive (MkRing [one] rightList) = switchActive(MkRing (one : reverse rightList) [])
switchActive (MkRing (active:next:others) rightList) = MkRing (next:active:others) rightList

focusNext :: Ring a -> Ring a
focusNext ring@(MkRing [] []) = ring
focusNext (MkRing [one] rightList) = focusNext (MkRing (one : reverse rightList) [])
focusNext (MkRing (active:leftList) rightList) = MkRing leftList (active:rightList)

focusPrev :: Ring a -> Ring a
focusPrev ring@(MkRing [] []) = ring
focusPrev (MkRing leftList []) = focusPrev (MkRing [] (reverse leftList))
focusPrev (MkRing leftList (prev:rightList)) = MkRing (prev:leftList) rightList
