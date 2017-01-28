-- recsum.hs


module RecSum where

recsum :: (Eq a, Num a) => a -> a
recsum 0 = 0
recsum n = n + recsum (n-1)



recMult :: (Integral a) => a -> a -> a
recMult 0 _ = 0
recMult _ 0 = 0
recMult 1 n = n
recMult n 1 = n
recMult a b | a < b      = b + recMult b (a-1)
            | otherwise  = a + recMult a (b-1)
