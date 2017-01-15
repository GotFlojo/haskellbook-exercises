--matchthetype.hs
--
--We ate going to give you two types and their implementations
--see if you can substitute the second type for the first

import Data.List

--1 
i :: Num a => a
--i:: a     does not typecheck because 1 is an instance of (Num a)
i = 1


--2
f :: Float
--f :: Num a => a   does not typecheck because Float is a specific subclass of
--Num and we can not substitiute a superclass for subclass only the other way
--around
f = 1.0


--3
--f' :: Float
f':: Fractional a => a  --does typcheck because Float is an instance of Fractional
f' = 1.0


--4 
--f'' :: Float
f'' :: RealFrac a => a  --does typecheck because Float is an instnace of RealFrac
f'' = 1.0


--5
--freud :: a -> a
freud :: Ord a => a -> a
freud x = x


--6
--freud' :: a -> a
freud' :: Int -> Int
freud' x = x


--7
myX = 1 ::Int

sigmund :: Int -> Int
--sigmund :: a -> a     -- does not typecheck becaus myX is Int so a must be Int
sigmund x = myX


--8
sigmund' :: Int -> Int
--sigmund' :: Num a => a -> a   --does not typecheck because myX is Int so a
--must be Int
sigmund' x = myX


--9
-- jung :: Ord a => [a] -> a
jung :: [Int] -> Int
jung xs = head (sort xs)


--10
--young :: [Char] -> Char
young :: Ord a => [a] -> a
young xs = head (sort xs)


--11
mySort :: [Char] -> [Char] 
mySort = sort

signifier :: [Char] -> Char
--signifier Ord a => [a] -> a   --does not typecheck mySort takes [Char] only
signifier xs = head (mySort xs)
