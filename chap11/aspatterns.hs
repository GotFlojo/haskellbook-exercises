--aspatterns.hs

import Data.Char


--solve the following exercises with as-Patterns
--
--1)
--This should return True if (and only if) all the values in the first list
--appear in the second list, though they need not be contiguous.

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf ax@(x:xs) (y:ys) | x == y    = isSubsequenceOf xs ys
                                 | otherwise = isSubsequenceOf ax ys


--2)
--Split a sentence into words, then tuple each word with the capitalized verson
--of each

capitalizeWords :: String -> [(String, String)]
capitalizeWords s = map (\ w@(c:cs) -> (w, toUpper c:cs)) (words s)
