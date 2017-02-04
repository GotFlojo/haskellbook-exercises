--filtering.hs

--Write a functions that gives use multiples of tree in a list from 1-30

divisibleBy3 = filter (\n -> rem n 3 == 0) [1..30]


-- How many multiple of three are there
l3 = length divisibleBy3


-- remove all articles from a sentence

removeArticle :: String -> [String]
removeArticle "" = []
removeArticle s = filter (\s -> s /= "an" && s /= "a") $ words s
