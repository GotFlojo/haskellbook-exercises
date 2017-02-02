--fearfullsymmetry.hs
--
--Using takeWhile and dropWhile, write a function that take a string and
--returns a list of string using using spaces to separate the elements 
--of the string into words

myWords :: String -> [String]
myWords "" = []
myWords (c:cs)   | c == ' '  = myWords cs
                 | otherwise = word : myWords rest
                        where word = takeWhile (/= ' ') (c:cs)
                              rest = dropWhile (/= ' ') (c:cs)


--Write a function that takes a string and returns a list of strings
--using newline to break up the string.

firstSen  = "Tyger, Tyger burning bright\n"
secondSen = "in the forest of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful summetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines "" = []
myLines (c:cs) | c == '\n' = myLines cs
               | otherwise = line : myLines rest
                where line = takeWhile (/= '\n') (c:cs)
                      rest = dropWhile (/= '\n') (c:cs)


--Write a function that parameterisze the character you're breaking
--on and rewrite myWords and myLines using it
mySplit :: String -> Char -> [String]
mySplit "" _ = []
mySplit (n:ns) c | n == c = mySplit ns c
                 | otherwise = token : mySplit rest c
                    where token = takeWhile (/= c) (n:ns)
                          rest  = dropWhile (/= c) (n:ns)
