--eqinstances.hs

-- Write the Eq instance for the datatype provided


--1
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn a) (TisAn b) = a == b 

--2 
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two a1 a2) (Two b1 b2 ) = (a1 == b1) && (a2 == b2)


--3
data StringOrInt = TisAnInt Integer | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt a) (TisAnInt b ) = a == b
    (==) (TisAString s1) (TisAString s2) = s1 == s2
    (==) _ _ = False

--4 
data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair a1 a2) (Pair b1 b2) = (a1 == b1) && (a2 == b2)

--5
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==)  (Tuple a1 b1) (Tuple a2 b2) = (a1 == a2) && (b1 == b2)

--6
data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne a1) (ThisOne a2) =  a1 == a2
    (==) (ThatOne a1) (ThatOne a2) = a1 == a2
    (==) _ _ = False

--7
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello a1) (Hello a2) = a1 == a2
    (==) (Goodbye a1) (Goodbye a2) = a1 == a2
    (==) _ _ = False
    (==) (Goodbye a1) (Goodbye a2) = a1 == a2
