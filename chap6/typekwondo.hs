--typekwondo.hs


--1
chk :: Eq b => (a -> b) -> a -> b -> Bool 
chk aTob a b = b == (aTob a)


--2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith aTob i a = (aTob a) + (fromInteger i)
-- fromInteger promotes Integer to Num a. 
