--phoneExercise.hs
--
import Data.Char
import Data.List

{-
Layout of the phone
  ------------------------
  | 1     | 2ABC | 3DEF  |
  ------------------------
  | 4GHI  | 5JKL | 6MNO  |
  ------------------------
  | 7PQRS | 8TUV | 9WXYZ |
  ------------------------
  | *^    | 0+_  | #.,   |
  ------------------------

Where star (*) gives you capitalization of the letter you are writting to
your friends, and 0 is your space bar. To represent the digit itself you
press that digit once more than the letters it reperesents. If you press a
button one more than is required to type the digit, it wraps around to 
the first letter
-}


--1)
--Create a datastructure to capture the phone layout above
data DaPhone = DaPhone [Button]
data Button = Capitalize
             | Button Digit String

-- validButtons = "1234567890*#"
type Digit = Char

--valid presses: 1 and up
type Presses = Int

myPhone :: DaPhone
myPhone = DaPhone [ Button  '1' "1",
                    Button  '2' "abc2",
                    Button  '3' "def3",
                    Button  '4' "ghi4",
                    Button  '5' "jkl5",
                    Button  '6' "mno6",
                    Button  '7' "pqrs7",
                    Button  '8' "tuv8",
                    Button  '9' "wxyz9",
                    Button  '0' "+_ 0",
                    Button  '#' ".,#" ]

convo :: [String]
convo = [
    "Wanna play 20 questions", 
    "Ya", 
    "U 1st haha",
    "Lol ok. Have you ever tastet alcohol lol", 
    "Lol ya", 
    "Wow ur cool haha. Ur turn", 
    "Ok. Do u think I am pretty Lol", 
    "Lol ya", 
    "Haha thanks just making sure rofl ur turn" ]


--assuming the default phone definition
--'a' -> [('2', 1)]
--'A' -> [('*', 1), ('2', 1)]
reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps p@(DaPhone bs) c |isUpper c = ('*', 1) : reverseTaps p (toLower c)
                             |otherwise = filter (\(_, y) -> y /= 0) $ map pressesForC bs
                               where pressesForC = flip pressesForChar c

pressesForChar :: Button -> Char -> (Digit, Presses)
pressesForChar Capitalize _    = ('*', 1)
pressesForChar (Button d "") _ = (d, 0)
pressesForChar (Button d s) c  = case elemIndex c s of
                                 Nothing -> (d, 0)
                                 Just i  -> (d, i+1)

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead p = concatMap (reverseTaps p) 
