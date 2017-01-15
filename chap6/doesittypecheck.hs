--doesittypecheck.hs

-- For this set of exercises you'll be praticing looking for type and
-- typeclass errors

module DoesItTypecheck where

--1
{-data Person = Person Bool-}
data Person = Person Bool deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


--2
{-data Mood = Blah | Woot deriving Show-}
data Mood = Blah | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
                    then Blah
                    else x

--4
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Show, Eq)

s1 = Sentence "dogs" "drool" --can not be printed because it is a function (no Show)
s2 = Sentence "Julie" "loves" "dogs"

--Given the following datatype definitions what will typecheck

data Rocks = Rocks String deriving (Eq,  Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)

--1
{-phew = Papu "chases" True-}
phew = Papu (Rocks "chases") (Yeah True)

--2
truth = Papu (Rocks "chomskydoz") (Yeah True)

--3
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

--4 
{- The following does not typecheck because Papu is not an instance of Ord
 - but Ord is needed for (>)
comparePapus :: Papu -> Papu -> Boold
comparePapus p p' = p > p'
-}
