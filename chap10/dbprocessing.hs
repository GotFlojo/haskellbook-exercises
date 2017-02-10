--dbprocessing.hs
--
--write the following functions for processing this data
--
import Data.Time

data DatabaseItem = DbString String
                    | DbNumber Int
                    | DbDate UTCTime
                    deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [DbDate (UTCTime (fromGregorian 1911 5 1)
                     (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello World"
    , DbDate (UTCTime (fromGregorian 1921 5 1)
                      (secondsToDiffTime 34123))
    ]

--Write a functon that filters for DbDate values and returns a list of the
--UTCTimeValues inside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = map (\(DbDate u) -> u) $ filter isDbDate db
                    where isDbDate (DbDate _) = True
                          isDbDate _          = False
-- reimplement with fold
filterDbDate' :: [DatabaseItem] -> [UTCTime]
filterDbDate' db = foldr getUTC [] db
                    where getUTC (DbDate u) acc = u:acc
                          getUTC _ acc          = acc

-- reimplement with list comprehensions
filterDbDate'' :: [DatabaseItem] -> [UTCTime]
filterDbDate'' db = map (\(DbDate d) -> d) [ds | ds@(DbDate {}) <- db]


-- write a function that filters for DbNumber values and returns list of all the
-- Int values inside them
filterDbNumber :: [DatabaseItem] -> [Int]
filterDbNumber db = foldr getInt [] db
                        where getInt (DbNumber i) acc = i:acc
                              getInt _ acc            = acc


--write a function that returns the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate     --UTCTime is instance of Ord 


--write a function that gets the average of the DbNumber values
--you'll probably need to use fromIntegral to get from Integer to Double
avgDb :: [DatabaseItem] -> Double
avgDb db = let nums = filterDbNumber db in
               (fromIntegral $ sum nums) / (fromIntegral $ length nums)

