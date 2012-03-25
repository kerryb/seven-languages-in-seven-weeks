module PartiallyApplied where
  import Test.QuickCheck

  half = (*) 0.5

  {-tests-}

  prop_half x = half x == x / 2
