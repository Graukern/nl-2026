module Main where
import qualified Data.Sequence as Q
import Data.Foldable (toList)
main :: IO ()
main = do
  let s = Q.fromList [1,2,3] :: Q.Seq Int
      t = 0 Q.<| (s Q.|> 4)
  print (toList t)
  print (Q.lookup 2 t)
  print (Q.lookup 9 t)
