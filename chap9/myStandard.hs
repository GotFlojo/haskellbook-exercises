-- myStandard.hs
--
--
myAnd :: [Bool] -> Bool
myAnd []     = True
myAnd (x:xs) = if x == False then False else myAnd xs


--myOr returns true if any Bool in the list is true
myOr:: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs


--myAny returns true if (a -> Bool) returns True for any element in the list
myAny :: (a -> Bool) -> [a] -> Bool
myAny f []     = False
myAny f (x:xs) = f x || myAny f xs


myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem x (y:ys) = (x == y) || myElem x ys

--rewrite myELem using any
myElem' :: Eq a => a -> [a] -> Bool
myElem' x ys = any (==x) ys


--implement myReverse
myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = go xs []
    where go [] acc = acc
          go (x:xs) acc = go xs $ x : acc


--squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ squish xs      --performance?


--squishMap maps a funtction over a list and concatenates the results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs


--implement squish in terms of squishMap
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


--myMaximumBy takes a comparison function and a list and returs the greatest
--element from the list based on the last element that the comparison returned
--GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[])  = x
myMaximumBy f (x1:xs) = go f x1 xs
                where go f x1 []     = x1
                      go f x1 (x:xs) = case f x1 x of
                                         LT        -> go f x xs
                                         otherwise -> go f x1 xs

                                         
--myMinimumBy takes a comparison function and a list and returns the least
--elment of the list based on the last value for which comparison returned LT.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinmumBy _ [x]      = x
myMinimumBy f (x1:xs) = go f x1 xs
                where go f x []     = x
                      go f y (x:xs) = case f y x of
                                        LT       -> go f y xs
                                        othewise -> go f x xs


--write myMaximum and myMinimum in terms of myMaximumBy and myMinimumBy
myMaximum :: Ord a => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: Ord a => [a] -> a
myMinimum = myMaximumBy compare
