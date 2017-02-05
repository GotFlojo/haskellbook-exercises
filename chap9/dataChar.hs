--dataChar.hs
--
import Data.Char


-- Write a function that filers all the uppercase letters out of a string
upperCase :: String -> String
upperCase "" = ""
upperCase s  = filter isUpper s


--Write a function that will capitalize the first letter of a string and
--return the entire string
capitalizeFirst :: String -> String
capitalizeFirst ""     = ""
capitalizeFirst (c:cs) = (toUpper c) : cs


--Write a recursive function that will capitalise all letters
capitalize :: String -> String
capitalize ""     = ""
capitalize (c:cs) = (toUpper c) : capitalize cs


--Write a function that will capitalize the first letter and return only
--this letter
capitalFirst :: String -> Char
capitalFirst = toUpper . head
