module Reverse where
  import Test.QuickCheck

  reverse :: [a] -> [a]
  reverse xs = foldl (\ys y -> (y:ys)) [] xs

  {-tests-}

  prop_acts_like_builtin xs = Reverse.reverse xs == Prelude.reverse xs where
    types = xs::[Int]
