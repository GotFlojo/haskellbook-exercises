--casepractice.hs

--rewrite using case

--1
--The following should retung x when x is greater than y

-- functionC x y = if (x > ) then x else y
functionC x y = case x > y of
                    True -> x
                    False -> y

--2
--The followin will add 2 two to even number otherwise just return the input

-- ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2 n = case even n of 
                True -> n + 2
                False -> n

--3
--THe follwing indicates if value is greater, smaller or equal to 0
nums x = case compare x 0 of
            LT -> -1
            GT -> 1
            EQ -> 0

