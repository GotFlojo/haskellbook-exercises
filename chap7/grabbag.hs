--grabbag.hs

--1
--all equal
{-mTH x y z = x * y * z-}
{-mTH x y = \z -> x * y * z-}
{-mTH x = \y -> \z -> x * y * z-}
{-mTH = \x -> \y -> \z -> x * y * z-}

--2
--if mTH has Type Num a => a -> a -> a -> a
-- mTH 3 has Type Num a => a -> a -> a
--


--3
{-
addOneifOdd n = case odd n of
    True -> f n
    False -> n
    where f n = n +1
-}

addOneifOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1


--4
{-
 - addFive x y = (if x > y then y else x ) + 5
-}

addFive = \x y -> ((if x > y then y else x ) + 5)


--5
{-
 - mflip f = \x -> \y -> f y x
-}
mFlip f x y = f y x 
