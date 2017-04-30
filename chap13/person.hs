type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty 
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age | name /= "" && age > 0 = Right $ Person name age
                  | name == ""            = Left NameEmpty
                  | not (age > 0)         = Left AgeTooLow
                  | otherwise             = Left $ PersonInvalidUnknown $
                                                    "Name was " ++ show name ++
                                                    "Age was " ++ show age

-- prompt the user for name and age input
-- attempt to construct a Person using name age you entered
-- if it successfully constructed a person, it should print "Yay!
-- Successfully got a person:" followed by the Person value
-- If it got an error value, report that an error occured
-- and print the error
gimmePerson :: IO ()
gimmePerson = do
    putStrLn "Name of the Person: "
    name <- getLine
    putStrLn "Age of the Person: "
    ageStr <- getLine
    case mkPerson name $ read ageStr of
        Left error   -> putStrLn $ "Error: " ++ show error
        Right person -> putStrLn $ "Yay! Successfully got a person: " ++ show person
