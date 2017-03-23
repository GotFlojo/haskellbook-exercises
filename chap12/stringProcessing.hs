-- stringProcessing.hs

import Data.Char
import Data.List

--1) Write a recursive function called replace wich takes a text/string, 
--breakes it into words and replaces each instacen of 'the' with 'a'.
--It is intended only to replace exactly the word 'the'.

-- notThe "the" => Nothing
-- notThe "blathebla" => Just "blahtheblah"
-- notThe "woot" => Just "woot"
notThe :: String -> Maybe String
notThe s = if map toLower s == "the" then Nothing 
                                     else Just s 

-- replaceThe "the cow loves us" => "a cow loves us"
replaceThe :: String -> String
--replaceThe s = concat (intersperse " " $ map replace (words s))
replaceThe s = unwords (map replace (words s))
            where replace w = case notThe w of
                              Nothing -> "a"
                              Just s  -> s

--2) Write a recursive function that takes a string, breaks it into words, 
--and counts the number of instances of 'the' followed by a vowel 
--initiated word

--countTheBeforVowel "the cow" => 0
--countTheBeforVowel "the evil cow" => 1
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = toInteger . length . filter theBeforeVowel . wordpairs . words 
                    where wordpairs s@(w:ws) = zip s ws
                          theBeforeVowel (w1, (c:_)) | w1 == "the" = elem c "aeiou"
                                                     | otherwise = False


--3) Return the number of vowels in a word

-- countVowels "the cow" => 2
-- countVowels "Mikolajczak" => 4
countVowels :: String -> Integer
countVowels = toInteger . length. filter (isVowel . toLower) 

isVowel :: Char -> Bool
isVowel c = elem c "aeiou"


--4) Use the Maybe type to write a function that counts vowels in a string
-- and the number of consonants. If the number of vowels exceeds the number 
-- of consonants the function returns Nothing. In many human launguages the
-- number of vowels rarely exceeds the numer of consonants so when they do,
-- it indicates the string is not a real word.

newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord s = if vowelCount > notVowels then Nothing else Just (Word' s)
           where vowelCount = countVowels s
                 notVowels  = (toInteger $ length s) - vowelCount
