module LazySequences where
  import Test.QuickCheck

  every_third :: Int -> [Int]
  every_third x = (x:every_third (x + 3))

  {-tests-}

  prop_every_third x n = (every_third x) !! n' == x + 3 * n' where
    n' = mod n 10000
