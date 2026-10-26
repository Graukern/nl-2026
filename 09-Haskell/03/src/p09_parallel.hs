module Main where
import GHC.Conc (par, pseq)
fib :: Int -> Int
fib n | n < 2 = n
      | otherwise = fib (n-1) + fib (n-2)
pairSum :: Int -> Int -> Int
pairSum n m =
  let a = fib n
      b = fib m
  in a `par` (b `pseq` (a+b))
main :: IO ()
main = print (pairSum 20 21)
