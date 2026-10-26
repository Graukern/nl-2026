module Main where
import Control.Concurrent.STM
transfer :: Int -> TVar Int -> TVar Int -> STM ()
transfer amount from to = do
  balance <- readTVar from
  check (balance >= amount)
  modifyTVar' from (subtract amount)
  modifyTVar' to (+ amount)
takeEither :: TQueue a -> TQueue a -> STM a
takeEither left right = readTQueue left `orElse` readTQueue right
main :: IO ()
main = do
  accountA <- newTVarIO 100
  accountB <- newTVarIO 20
  atomically (transfer 30 accountA accountB)
  balances <- atomically $ do
    a <- readTVar accountA
    b <- readTVar accountB
    pure (a,b)
  print balances
  left <- newTQueueIO
  right <- newTQueueIO
  atomically (writeTQueue right "right")
  atomically (takeEither left right) >>= putStrLn
