--myListFuncs.hs
--
--rewrite standard functions in terms of fold
--Try rewriting functions in point free style


-- direct recursion, not using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = if x == False then False else myAnd xs


-- direct recursion, using (&&)
myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x:xs) = x && myAnd' xs


-- fold, not point-free in the folding function
myAnd'' :: [Bool] -> Bool
myAnd'' = foldr (\a b-> if a == False then False else b) True


-- fold, both myAnd and the folding function are point-free now
myAnd''' :: [Bool] -> Bool
myAnd''' = foldr (&&) True


--1) myOr returns True if any Bool in the list is True
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

myOr' :: [Bool] -> Bool
myOr' = foldr (||) False


--2) myAny returns true if a -> Bool applied to any of the values in the list
--returns true
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f = foldr (\x y -> f x || y) False

-- replacing the lambda with function composition
myAny'' :: (a -> Bool) -> [a] -> Bool
myAny'' f = foldr ((||) . f) False


--3) Write two versions of myElem. One version should use folding 
--and the other should use any
myElem1 :: Eq a => a -> [a] -> Bool
myElem1 x = any (==x)


myElem2 :: Eq a => a -> [a] -> Bool
myElem2 x = foldr (\b c -> b==x || c) False


--4) Implement myReverse. Don't worry abount trying to make it lazy
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) [] 


--5) Implement myMap in terms of foldr. It should behave the same as
--the built-in map
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x y -> f x : y) []

myMap' :: (a -> b) -> [a] -> [b]
myMap' f = foldr ((:) . f) []


--6) Implement myFilter in terms of foldr. It should behave the same as
--the built-in filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x y -> if f x then x:y else y) []


--7) squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squish' :: [[a]] -> [a]
squish' = foldl (++) []

squish'' :: [[a]] -> [a]
squish'' = foldr (++) []


--8) squishMap maps a function over a list and concatenates the results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs 

squishMap' ::(a -> [b]) -> [a] -> [b]
squishMap' f = foldr ((++) . f) []

squishMap'' :: (a -> [b]) -> [a] -> [b]
squishMap'' f = foldr (\x y -> f x ++ y) []


--9) squishAgain flattens a list of lists into a list. This time reuse the
--squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap' id


--10) myMaximumBy takes a comparison function and a list and returns the
--greatest element of the list based on the last value that the comparison
--returned GT for
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (n:ns) = foldl (\x y -> if f x y == GT then x else y) n ns


--11) myMinimumBy takes a comparison function and a list and returns the
--least element of the list based on the last value that the comparison
--returned LT for
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (n:ns) = foldl (\x y -> if f x y == LT then x else y) n ns
