module Main where
import qualified Data.Set as S
import qualified Data.Map.Strict as M
main :: IO ()
main = do
  let s = S.fromList [3,1,3,2] :: S.Set Int
      m = M.fromList [("a",1),("b",2)] :: M.Map String Int
  print (S.toAscList s)
  print (S.member 2 s)
  print (S.toAscList (S.insert 4 s))
  print (S.toAscList s)
  print (M.lookup "a" m)
  print (M.lookup "z" m)
  print (M.lookup "a" (M.insert "a" 7 m))
