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
