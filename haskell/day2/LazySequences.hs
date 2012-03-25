module LazySequences where
  import Test.QuickCheck

  every_third x = (x:every_third (x + 3))

  every_fifth x = (x:every_fifth (x + 5))

  every_eighth x y = zipWith (+) (every_third x) (every_fifth y)

  {-tests-}

  prop_every_third x n = (every_third x) !! n' == x + 3 * n' where
    n' = mod n 10000

  prop_every_fifth x n = (every_fifth x) !! n' == x + 5 * n' where
    n' = mod n 10000

  prop_every_eighth x y n = (every_eighth x y) !! n' == x + y + 8 * n' where
    n' = mod n 10000
