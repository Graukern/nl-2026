module Main where

outer :: Int
outer = 10

scoped :: Int
scoped = let outer = 3 in outer + 1

circleArea :: Double -> Double
circleArea r = pi * squared
  where
    squared = r * r

main :: IO ()
main = do
  print outer
  print scoped
  print outer
  print (circleArea 0)
  let local = 20 :: Int
  print (local + outer)
