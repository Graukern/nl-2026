module Main where
import Control.Concurrent (forkIO)
import Control.Concurrent.Chan
main :: IO ()
main = do
  ch <- newChan
  _ <- forkIO (writeChan ch "ready")
  readChan ch >>= putStrLn
