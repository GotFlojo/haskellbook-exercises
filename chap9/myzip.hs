-- myzip.hs
--
--
-- Write your own version of zip :: [a] -> [b] -> [(a, b] and ensure it behaves
-- like the original

myzip :: [a] -> [b] -> [(a, b)]
myzip [] _          = []
myzip _ []          = []
myzip (a:as) (b:bs) = (a, b) : myzip as bs


-- Do what you did for zip but for zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _          = []
myZipWith _ _ []          = []
myZipWith f (a:as) (b:bs) = (f a b) : myZipWith f as bs


-- Implement myzip in terms of myZipWith

myzip' :: [a] -> [b] -> [(a, b)]
myzip' = myZipWith (,) 
