module Main where
import Data.Array (Array, (!), (//), listArray)
main :: IO ()
main = do
  let a = listArray (1,3) ["one","two","three"] :: Array Int String
      b = a // [(2,"TWO")]
  print (a ! 2)
  print (b ! 2)
  print (a ! 2)
