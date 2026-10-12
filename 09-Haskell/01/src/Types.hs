module Types where

type Name = String
newtype Age = Age Int

data Shape = Circle Double | Rectangle Double Double

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

xs :: [Int]
xs = [1,2,3]
ys :: [Int]
ys = 0 : xs
