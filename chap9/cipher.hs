--cipher.hs
--

--Write a basic Caesar Cipher that shifts rightwards

module Cipher where

import Data.Char

shiftRight :: Int -> Char -> Char
shiftRight i c | c `elem` ['a'..'z'] = chr $ mod overhang 26 + offset
               | otherwise       = c
               where offset   = ord 'a'
                     overhang = ord c + i - ord 'a'


ceasar :: Int -> String -> String
ceasar _ "" = ""
ceasar i s  = map (shiftChar i . toLower) s
        where shiftChar = shiftRight 
