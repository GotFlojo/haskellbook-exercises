--myabs.hs


module Abs where

{- Write a function that returns the absolute value of a number using
 - if then else -}


myAbs :: Integer -> Integer
myAbs n = if n >= 0 then n else negate n

main :: IO ()
main = print ( myAbs (-5) )
