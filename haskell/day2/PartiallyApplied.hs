module PartiallyApplied where
  import Test.QuickCheck

  half = (*) 0.5

  add_newline = append '\n' where
    append a b = b ++ [a]

  {-tests-}

  prop_half x = half x == x / 2

  prop_add_newline s = add_newline s == s ++ "\n"
