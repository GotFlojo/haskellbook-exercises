--datacons.hs

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = 
         PapuAir
        |CatapultsR'Us
        |TakeYourChancesUnited
        deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
              |Plane Airline Size
              deriving(Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir (Size 3.0)


--1) What is the type of Car
--type of Car is Vehicle


--2) define the following functions
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _           = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar


--3) now we are going to write a function to tell us the manufacturere
--of a piece of data
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
getManu _         = error "Not a Car"


--4) Add a size argument to the plane data constructor and change the data
--and funtions
data Size = Size Double deriving (Show, Eq)
