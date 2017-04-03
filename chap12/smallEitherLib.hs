--smallEitherLib.hs
--

--1) Try to eventually arrive at a solution that uses foldr
lefts' :: [Either a b] -> [a]
lefts' = foldr leftOnly []
       where leftOnly (Left e) acc = e:acc
             leftOnly _ acc        = acc


--2) Same as the last one. Use foldr eventually
rights' :: [Either a b] -> [b]
rights' = foldr rightOnly []
       where rightOnly (Right e) acc = e:acc
             rightOnly _ acc = acc


--3)
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' es = (lefts' es, rights' es)

--4)
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right x) = Just $ f x


--5) This is a general catamorphism for Either values
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' aToC _ (Left x)  = aToC x
either' _ bToC (Right x) = bToC x


--6) Same as before but use the either' function you just wrote
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' _ (Left _) = Nothing
eitherMaybe'' f e = Just $ either' undefined f e
