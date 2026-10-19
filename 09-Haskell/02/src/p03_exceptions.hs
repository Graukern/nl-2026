module Main where
import Control.Exception (ArithException, ErrorCall, evaluate, try)
main :: IO ()
main = do
  result <- try (evaluate (10 `div` 0)) :: IO (Either ArithException Int)
  putStrLn (either (const "arithmetic exception caught") show result)
  xs <- evaluate [1, error "later"] :: IO [Int]
  print (length xs)
  result2 <- try (evaluate (sum xs)) :: IO (Either ErrorCall Int)
  putStrLn (either (const "element exception caught") show result2)
