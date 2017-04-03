--binaryTreeUnfold.hs

data BinaryTree a = 
      Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

--1) Write unfold for BinaryTree
unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f x = case f x of
           Nothing -> Leaf
           Just (x, b, z) -> Node (unfold f x) b (unfold f z)


--2) Make a tree builder
-- Using the unfold function you've just made for BinaryTree
-- write the following function
--
-- treeBuild 0 => Leaf
-- treeBuild 1 => Node Leaf 0 Leaf
-- treeBuild 2 => Node (Node Leaf 1 Leaf) 0 (Node Leaf 1 Leaf)
-- treeBuild 3 => Node (Node (Node Leaf 2 Leaf)
--                           1
--                           (Node Leaf 2 Leaf))
--                     0     
--                     (Node (Node Leaf 2 Leaf) 
--                           1 
--                           (Node Leaf 2 Leaf))
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold mkTree 0
            where mkTree :: Integer -> Maybe (Integer, Integer, Integer)
                  mkTree m | m == n    = Nothing    --unfold Nothing => Leaf
                           | otherwise = Just (m + 1, m, m + 1)
                                                    --start with 0 and build up
                                                    --until we hit Nothing case

