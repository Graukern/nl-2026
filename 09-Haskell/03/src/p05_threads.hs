module Main where
import Control.Concurrent
import Control.Exception (throwIO, evaluate)
main :: IO ()
main = do
  done <- newEmptyMVar
  _ <- forkFinally (evaluate (42 :: Int)) (putMVar done)
  result <- takeMVar done
  value <- either throwIO pure result
  print value
