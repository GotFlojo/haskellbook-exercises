-- squarecube.hs
--

mySqr  = [x^2 | x <- [1..5]]
myCube = [ x^3 | x <- [1..5]]


-- Write a an expression that will make tuples of the output of
-- mySqr and myCube

myTuple = [(x, y) | x <- mySqr, y <- myCube]


-- Alter that expression so that it only uses x and y values 
-- that are less then 50
myTuple' = [(x, y) | x <- mySqr, y <- myCube, x < 50, y<50]
