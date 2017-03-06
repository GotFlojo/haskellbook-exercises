--vigenerecipher.hs
--

--Write a Vigener Cipher

module VigenereCipher where

import Data.Char

shiftRight :: Int -> Char -> Char
shiftRight i c | c `elem` ['a'..'z'] = chr $ mod overhang 26 + offset
               | otherwise       = c
               where offset   = ord 'a'
                     overhang = ord c + i - ord 'a'

shiftChars :: [Int] -> String -> String
shiftChars = zipWith shiftRight

distance :: String -> [Int]
distance = map (\c -> ord c - ord 'a')

applyKey :: String -> String -> String
applyKey "" (k:ks)     = ""
applyKey (w:ws) (k:ks) = if elem w ['a'..'z'] then k : applyKey ws ks
                                              else w : applyKey ws (k:ks)
vigenere :: String -> String -> String
vigenere "" _ = ""
vigenere _ "" = ""
vigenere p k = shiftChars (distance keyMapping) (lowercase p)
            where lowercase  = map toLower
                  keyMapping = applyKey (lowercase p) (cycle $ lowercase k)

