module Functions where

step :: (Int, Int) -> (Int, Int)
step (x, y) = (x + 1, y - 1)

isZero :: Int -> Bool
isZero x = x == 0
