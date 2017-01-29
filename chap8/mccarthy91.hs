--mccarthy91.hs


module McCarthy91 where

mccarthy91 :: Integer -> Integer
mccarthy91 n | n > 100   = n - 10
             | otherwise = mccarthy91 . mccarthy91 $ (n + 11)
