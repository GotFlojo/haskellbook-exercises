--thequad.hs
--

data Quad = One
            | Two
            | Three
            | Four
            deriving (Eq, Show)

-- How many different Forms can this take
eQuad :: Either Quad Quad
eQuad = undefined
-- 4 + 4 = 8
--
prodQuad :: (Quad, Quad)
prodQuad = undefined
-- 4 * 4 = 16

funcQuad :: Quad -> Quad
funcQuad = undefined
-- 4⁴ = 256

prodTBool :: (Quad, Quad, Quad)
prodTBool = undefined
-- 2*2*2 = 16

gTwo :: Bool -> Bool -> Bool
gTwo = undefined
-- (2²)² = 16

fTwo :: Bool -> Quad -> Quad
fTwo = undefined
--  (4⁴)¹ = 256² = 65536
