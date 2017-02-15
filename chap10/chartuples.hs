--chartuples.hs
--

stops  = "pbtdkg"
vowels = "aeiou"

--write a function that takes input from stops and vowels and makes 3-tuples of 
--all possible stop-vowel-stop combinations

charTuples = [(a, b, c) | a<-stops, b<-vowels, c<-stops]


--modify that function so that it only returns combinations that beginn 
--with a p
pTuples= [(a, b, c)| a<-stops, b<-vowels, c<-stops, a=='p']


nouns = ["color", "slope", "eggnog", "cherry", "yak", "quicksand", "channel", "rabbit", "iron", "scarecrow", "payment", "mom"]
verbs = ["lighten", "travel", "list", "fear", "bury", "flash", "hover", "clean", "reduce", "encourage", "relax", "cry"]

--now set up a list of nouns and verbs and modify the function to return
--noun-verb-noun combinations
sentenceTuples ns vs = [(n1, v, n2) | n1<-ns, v<-vs, n2<-ns]


seekritFunc :: String -> Int
seekritFunc x = 
    div (sum (map length (words x)))
        (length (words x))


seekritFunc' :: (Fractional a) => String -> a
seekritFunc' x = 
    (/) (fromIntegral (sum (map length (words x))))
        (fromIntegral (length (words x)))
