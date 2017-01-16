--chap7exercises.hs

--The following function returns the tens digit of an Integral argument
{-tensDigit :: Integral a => a -> a-}
{-tensDigit x = d-}
    {-where xLast = x `div` 10-}        --This cut's the ones digit
          {-d     = xLast `mod` 10-}    --The last digit is the tens digit
                                        --mod will give us this digit by
                                        --treating the hundred digit like a tens
                                        --digit
--1, 2
--The types are the same
tensDigit :: Integral a => a -> a
tensDigit x = d
    where (xLast, _) = divMod x 10 
          (_, d)     = divMod xLast 10

hunsD :: Integral a => a -> a 
hunsD x = d
    where (x2Last, _) = divMod x 100
          (_, d)     = divMod x2Last 10


--2
-- implement foldBool once with guards and once with case

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y True = x
foldbool1 x y False = y

foldbool2 :: a -> a -> Bool -> a
foldbool2 x y b
        | b = x
        | otherwise = y

foldbool3 :: a -> a -> Bool -> a
foldbool3 x y b = case b of
                True -> x
                False -> y

--3
-- Fill in the definition
g :: (a -> b) -> (a, c) -> (b, c)
g aTob (a, c) = (aTob a, c)
