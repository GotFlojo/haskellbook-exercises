--enumFrnmTo.hs
--
--Write yout own enumFromTo definitions for the type provided. Do not
--use range syntax to do so.
--

module EnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool b1 b2 | b1 == b2 = [b1]
              | b1 == True = []
              | otherwise = [False, True]


eftOrdering :: Ordering -> Ordering -> [Ordering]
eftOrdering o1 o2 | o1 > o2  = []
                  | o1 == o2  = [o1]
                  | otherwise = o1 : eftOrdering (succ o1) o2


eftInt :: Int -> Int -> [Int]
eftInt i1 i2 | i1 > i2  = []
             | i1 == i2  = [i1]
             | otherwise = i1 : eftInt (succ i1) i2


eftChar :: Char -> Char -> [Char]
eftChar c1 c2 | c1 > c2 = []
            | c1 == c2 = [c1]
            | otherwise = c1 : eftChar (succ c1) c2
