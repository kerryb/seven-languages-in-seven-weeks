module LazySequences where
  import Test.QuickCheck

  every_third :: Int -> [Int]
  every_third x = (x:every_third (x + 3))

  every_fifth :: Int -> [Int]
  every_fifth x = (x:every_fifth (x + 5))

  {-tests-}

  prop_every_third x n = (every_third x) !! n' == x + 3 * n' where
    n' = mod n 10000

  prop_every_fifth x n = (every_fifth x) !! n' == x + 5 * n' where
    n' = mod n 10000
