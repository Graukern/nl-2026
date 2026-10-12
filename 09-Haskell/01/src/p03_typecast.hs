module Main where
import Text.Read (readMaybe)

half :: Int -> Double
half n = fromIntegral n / 2

main :: IO ()
main = do
  print (half 7)
  print (round (2.7 :: Double) :: Int)
  print (truncate (2.7 :: Double) :: Int)
  print (floor (2.7 :: Double) :: Int)
  print (ceiling (2.7 :: Double) :: Int)
  print (readMaybe "42" :: Maybe Int)
  print (readMaybe "oops" :: Maybe Int)
  putStrLn (show (42 :: Int))
