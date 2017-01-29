--wordnumber.hs


-- fill in the implemtation so that wordNumber returns the english word version
-- of the Int value
module WordNumber where

import Data.List (intersperse)

-- This is a partial implementation which is bad
digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"


digits :: Int -> [Int]
digits n = go n []
    where go d ds | d < 10    = d:ds
                  | otherwise = go (div d 10) ((mod d 10) : ds)


wordNumber :: Int -> String
wordNumber n = concat $ intersperse "-" (map digitToWord $ digits n)
