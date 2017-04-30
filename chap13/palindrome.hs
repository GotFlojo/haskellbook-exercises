import Control.Monad
import System.Exit (exitSuccess)
import Data.Char

isAlphabetChar :: Char -> Bool
isAlphabetChar = (flip elem) ['a'..'z']

lowerCaseString :: String -> String
lowerCaseString = map toLower

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    case ((cleanLine line1) == (reverse  $ cleanLine line1)) of
        True -> putStrLn "It's a palindrome"
        False -> do 
            putStrLn "Nope!"
            exitSuccess
    where cleanLine s = filter isAlphabetChar $ lowerCaseString s
