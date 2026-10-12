module Main where

type Name = String
newtype Age = Age Int deriving Show
data Shape = Circle Double | Rectangle Double Double deriving Show

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

main :: IO ()
main = do
  print (42 :: Int)
  print (10 ^ (30 :: Int) :: Integer)
  print (3.14 :: Double)
  print True
  print 'H'
  print ("Haskell" :: Name)
  print (Age 20)
  print (Rectangle 3 4)
  print (area (Rectangle 3 4))
