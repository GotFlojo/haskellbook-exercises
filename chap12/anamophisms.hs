--anamorphisms.hs

import Data.Maybe


--1) Write the function myIterate using direct recursion. Compare
-- with the the built-in iterate to gauge for correctness.

--iterate is like a very limited unfold that never ends
--because it never ends we must use take to get a finite list
--take 10 $ iterate (+1) 0 => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)


--2) Write the function myUnfoldr using direct recursion. Compare
-- with the built-in function unfoldr to check your implementation

--unfoldr is more flexible. The full monty as it were
--Using unfoldr to do the same thing as iterate
--take 10 $ unfoldr (\b -> Just (b, b+1)) 0 => [1, 2, 3, 4, 5, 6, 7, 8, 9]
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f x = case f x of
                Nothing     -> []
                Just (a, b) -> a : myUnfoldr f b


--3) Rewrite myIterate using myUnfoldr
betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\b -> Just (b, f b))
