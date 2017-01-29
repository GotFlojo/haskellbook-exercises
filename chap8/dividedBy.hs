-- dividedBy.hs
--

module DivideBy where



data DividedResult = Result Integer | DividedByZero deriving (Show)

dividedBy :: Integer -> Integer -> DividedResult
dividedBy _ 0 = DividedByZero
dividedBy num denum | num < 0 && denum < 0 = Result $ go (abs num) (abs denum) 0 
                    | num < 0 || denum < 0 = Result ((-1) * (go (abs num) (abs denum) 0))
                    | otherwise            = Result $ go num denum 0
                    where go n d c | n < d     = c 
                                   | otherwise = go (n - d) d (c + 1)
