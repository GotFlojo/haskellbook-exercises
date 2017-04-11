module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import Sytem.Random (randomRIO)

main :: IO ()
main = do
  putStrLn "hello world"
