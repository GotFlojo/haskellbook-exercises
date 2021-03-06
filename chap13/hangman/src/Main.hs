module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

newtype WordList = Wordlist [String] deriving (Eq, Show)

data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
    show (Puzzle _ discovered guessed) = 
        (intersperse ' ' $ fmap renderPuzzleChar discovered)
        ++ " Guessed so far: " ++ guessed


minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9 

allWords :: IO WordList
allWords = do
    dict <- readFile "data/dict.txt"
    return $ Wordlist (lines dict)

gameWords :: IO WordList
gameWords = do
    (Wordlist aw) <- allWords
    return $ Wordlist (filter gameLength aw)
    where gameLength w =  
            let l = length (w :: String)
            in  l > minWordLength && l < maxWordLength

randomWord :: WordList -> IO String
randomWord (Wordlist wl) = do
    randomIndex <- randomRIO (0, length wl - 1)
    return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

freshPuzzle :: String -> Puzzle
freshPuzzle s = Puzzle s (map (const Nothing) s) []

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle word _ _) c = elem c word

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) c = elem c guessed

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing  =  '_'
renderPuzzleChar (Just c) =  c

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter p@(Puzzle word filledInSoFar s) c = 
    Puzzle word newFilledInSoFar newGuesses
    where zipper guessed wordChar guessChar = 
            if wordChar == guessed then Just wordChar else guessChar
          newFilledInSoFar = 
            zipWith (zipper c) word filledInSoFar
          newGuesses = if charInWord p c then s else (c:s)

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
    putStrLn $ "Your Guess was: " ++ [guess]
    case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
        (_, True) -> do
            putStrLn "You already guessed that character \
                      \pick something else!"
            return puzzle
        (True, _) -> do
            putStrLn "The character was in the word,\
                    \ filling in the word accordingly"
            return (fillInCharacter puzzle guess)
        (False, _) -> do
            putStrLn "This character wasn't in\
                     \ the word, try again"
            return (fillInCharacter puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) = 
    if (length guessed > (max 7 $ length wordToGuess)) then
        do
            putStrLn "You lose!"
            putStrLn $ "The word was: " ++ wordToGuess
            exitSuccess
        else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) = 
    if all isJust filledInSoFar then
        do putStrLn "You win!"
           exitSuccess
        else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
    gameOver puzzle
    gameWin puzzle
    putStrLn $ "Current puzzle is: " ++ show puzzle
    putStrLn "Guess a letter: " 
    guess <- getLine 
    case guess of 
        [c] -> handleGuess puzzle c >>= runGame
        _   -> putStrLn "Your guess must\
                        \ be a single character"

main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle (fmap toLower word)
  runGame puzzle
