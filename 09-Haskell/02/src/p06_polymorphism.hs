module Main where
data Box a = Box a deriving (Eq, Show)
unbox :: Box a -> a
unbox (Box x) = x
keep :: a -> a
keep x = x
mapBox :: (a -> b) -> Box a -> Box b
mapBox f (Box x) = Box (f x)
main :: IO ()
main = do
  print (unbox (Box (7 :: Int)))
  print (keep "hello")
  print (mapBox show (Box (7 :: Int)))
