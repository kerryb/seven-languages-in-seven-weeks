module Main where
  import Test.QuickCheck

  data Hash a b = Hash [Pair a b] deriving (Show)
  data Pair a b = Value a b | Nested a (Hash a b) deriving (Show)
  (-->) k v = Value k v
  (-=>) k v = Nested k v

  hash = Hash ["foo" --> 1, "bar" --> 2, "baz" -=> Hash ["quz" --> 3, "quuz" --> 4]]

  main :: IO ()
  main = do putStrLn $ show $ hash

  {-tests-}

