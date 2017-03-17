--huttonsrazor.js

-- Huttons Razor is a very simple expression language that expresses integer
-- literals and addition of values in that expression language
-- The 'trick' is that it's recursive and the two expression you're summing
-- together could be literals or themselves further addition operations


--1) Your first task is to write the 'eval' function which reduces an expression
--to a final sum

data Expr
    = Lit Integer
    | Add Expr Expr 

--example eval(Add (Lit 1) (Lit 9001)) -> 9002
eval :: Expr -> Integer
eval (Lit i)     = i
eval (Add e1 e2) = (eval e1) + (eval e2)


--2) Write a printer for the expressions

--example printExpr (Add (Lit 1) (Lit 9001)) ->  "1 + 9001"
printExpr :: Expr -> String
printExpr (Lit i) = show i
printExpr (Add e1 e2) = printExpr e1 ++ " + " ++ printExpr e2
