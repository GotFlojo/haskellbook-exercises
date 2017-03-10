--capitalize.hs
--


import Data.Char

--1)
--Write a function that capitalizes a word
capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (c:cs) | isAlpha c = toUpper c : cs
                      | otherwise = c : (capitalizeWord cs)


--2)
--Write a function that capitalizes sentences in a paragraph.
--Recognize when a new sentence has begun by checking for periods.
--Reuse the capitalizeWords function
capitalizeParagraph :: String -> String
capitalizeParagraph s = concatMap capitalizeWord $ splitPeriod s

splitPeriod :: String -> [String]
splitPeriod = foldr (\x l@(w:ws) -> if x /= '.' then (x:w):ws 
                                                else "":(".":l)) [""] 
