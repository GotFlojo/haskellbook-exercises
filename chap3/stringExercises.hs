-- Given "Curry is awesome"
-- Return "Curry is awesome!"
really :: String -> String
really s = s ++ "!"

-- Given "Curry is awesome!"
-- Return "y"
fifthChar :: String  -> String
fifthChar x = ( x !! 4 ) : "" -- This needs to be String but !! returns Char

-- Given "Curry is awesome!"
-- Return "awesome!"
dropChars :: String -> String
dropChars s = drop 9 s

--Write a function of type String -> Char
--which returns the third character in a String
thirdChar :: String  -> Char
thirdChar x = x !! 2

-- Now change that function so the string operated on is always the same and the 
-- variable represents the number of the letter you want to return (you can use “Curry 
-- is awesome!” as your string input
letterIndex :: Int -> Char
letterIndex n = "Curry is awesome" !! (n - 1)

-- Using the take and drop functions we looked at above, see if you can write a 
-- function called rvrs (an abbreviation of ‘reverse’ used because there is a 
-- function called ‘reverse’ already in Prelude, so if you call your function the 
-- same name, you’ll get an error message). rvrs should take the string “Curry is 
-- awesome” and return the result “awesome is Curry.” This may not be the most
-- lovely Haskell code you will ever write, but it is quite possible using only 
-- what we’ve learned so far. First write it as a single function in a source file. 
-- This doesn’t need to, and shouldn’t, work for reversing the words of any 
-- sentence. You’re expected only to slice and dice this particular string with 
-- take and drop.
rvrs :: String -> String
rvrs s = end ++ " " ++  middle ++ " " ++ beginning
    where
        beginning = take 5 s
        middle    = take 2 (drop 6 s)
        end       = drop 9 s
