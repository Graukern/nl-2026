module Main where
import Control.Concurrent (forkFinally, newEmptyMVar, putMVar, takeMVar)
import Control.Concurrent.STM
import Control.Exception (throwIO)
import Control.Monad (forM_, replicateM)
main :: IO ()
main = do
  counter <- newTVarIO (0 :: Int)
  done <- replicateM 100 newEmptyMVar
  forM_ done $ \signal -> do
    _ <- forkFinally
      (atomically $ modifyTVar' counter (+1))
      (putMVar signal)
    pure ()
  results <- mapM takeMVar done
  mapM_ (either throwIO pure) results
  readTVarIO counter >>= print
