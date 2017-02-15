--scanfibs.hs
--
--fibonacci numbers using a scan function

--Infinite list of fibonacci numbers
fibs :: (Integral a) => [a]
fibs = 1 : scanl (+) 1 fibs

--using bang bang (!!) to index into a list gives the nth fibonacci number
fibN x = fibs !! x


-- Evaluating the fibs function
--scanl f q ls = 
--  q : (case ls of 
--          []     -> []
--          (x:xs) -> scanl f (f q x) xs
--          
-- ls == fibs = 1 : ...
--fibs == 1 : 1: scanl (+) (+ 1 1) (scanl + 1 fibs)
--fibs == 1 : 1 : scanl (+) (+ 1 1) (1 : scanl (+) (+ 1 1) (scanl + 1 fibs)
--fibs == 1 : 1 : 2 : scanl (+) (+ 2 1) scanl (+) (+ 1 1 ) (scanl + 1 fibs)
--fibs == 1 : 1 : 2 : scanl (+) (+ 2 1) [2 : scanl (+) (+ 2 1) scanl (+)  (+ 1
--1) (scanf +1 fibs)
--
--fibs == 1 : 1 : 2 : 3 : scanl (+) (+ 3 2) scanl (+) (+ 2 1) scanl (+)  (+1 1)
--scanl + 1 fib
--fibs == 1 : 1 : 2 : 3 : scanl (+) (+ 3 2) [3, ...] 
--fibs == 1 : 1 : 2 : 3 : 5 : scanl (+) (+ 5 3) [5, ...]


-- Rewrite the factorial function as scan
--
fac :: (Integral a) => [a]
fac = 1 : scanl (*) 2 [3..]
