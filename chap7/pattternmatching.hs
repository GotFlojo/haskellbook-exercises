--patternmatchin.hs


k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("Three", (1 + 2))
k3 = k (3, True)

--1
--Type of k
k :: (a, b) -> a


--2 
--Type of k2
k2 :: String


--3 
--Of k1, k2, k3 which will return the number 3?
--Answer: k1 k3


--2
--Fill in the definition of the following function

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
--f = unndefined
f (a, b, c)  (d, e, f) = ((a, d), (c, f))
