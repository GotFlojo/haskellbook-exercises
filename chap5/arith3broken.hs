-- module arith3

module Arith3broken where

{-
main :: IO()
Main = do
    print 1 + 2 
    putStrLn 10
    print (negate -1)
    print ((+) 0 blah)
    where blah = negate 1
-}

main :: IO()
main = do
    print (1 + 2) 
    putStrLn "10"
    print (negate (-1))
    print ((+) 0 blah)
    where blah = negate 1
