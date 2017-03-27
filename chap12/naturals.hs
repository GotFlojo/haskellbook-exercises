--naturals.hs


-- You'll be presented with a datatype to represent natural numbers.
-- The only numbers representable with the naturals are zero to infinity.
-- Your task will be to implement numbers to convert Naturals to Integers
-- and Integers to Naturals. The conversion from Naturals to Integres won't
-- return Maybe because Integers are a strict superset of Natural.
-- Any Natural can be repsesented by an Integer but the same is *not* true
-- of any Integer.

data Nat = Zero
         | Succ Nat
         deriving (Eq, Show)

--natToInteger Zero => 0
--natToInteger (Succ Zero) => 1
--natToIntgeer (Succ (Succ Zero)) => 2
natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n


-- integerToNat 0 => Just Zero
-- integerToNat 1 => Just (Succ Zero)
-- integerToNat 2 => Just (Succ (Succ Zero))
-- integerToNat (-1) => Nothing
integerToNat :: Integer -> Maybe Nat
integerToNat n | n < 0     = Nothing
               | otherwise = Just $ mkNat n
               where mkNat 0 = Zero
                     mkNat n = Succ $ mkNat (n - 1)
