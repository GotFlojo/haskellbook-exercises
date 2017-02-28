-- binarytree.hs
--


data BinaryTree a = 
                    Leaf                                 -- an empty node
                  | Node (BinaryTree a) a (BinaryTree a) -- A node with an 'a' in it
                  deriving (Eq, Ord, Show)

-- insert into tree or create new tree
insert :: (Ord a) => a -> BinaryTree a -> BinaryTree a
insert x Leaf = Node Leaf x Leaf
insert x (Node left y right) | x == y = Node left y right
                             | x < y  = Node (insert x left) y right
                             | x > y  = Node left y (insert x right)


-- write a map function for binary trees
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left x right) = Node (mapTree f left) (f x) (mapTree f right)


testTree :: BinaryTree Integer
testTree = Node (Node Leaf 3 Leaf)  1 (Node Leaf 4 Leaf)

mapExpected = 
    Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

--acceptance test for mapTree
mapOkay = 
    if mapTree (+1) testTree == mapExpected
        then print "Yup okay"
        else error "test failed!"


--write a function to convert BinaryTree values into a list

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left x right) = x : (preorder left) ++ (preorder right)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left x right) = (preorder left) ++ [x] ++ (preorder right)

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left x right) = (preorder left) ++ (preorder right) ++ [x]

testPreorder :: IO ()
testPreorder = if preorder testTree == [1, 3, 4]
               then putStrLn "Preorder fine!"
               else putStrLn "Bad news bears"

testInorder :: IO ()
testInorder = if inorder testTree == [3, 1, 4]
              then putStrLn "Inorder fine!"
              else putStrLn "Bad news bears"

testPostorder :: IO ()
testPostorder = if postorder testTree == [3, 4, 1]
               then putStrLn "Postorder fine!"
               else putStrLn "Bad news bears"


--Write foldr for Binary Tree. Given the definition for BinaryTree, 
--write a Catamorphism for the binary tree

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b bt = foldr f b (inorder bt)
