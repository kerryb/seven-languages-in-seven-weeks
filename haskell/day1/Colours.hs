module Colours where
  import Test.QuickCheck
  import Data.List

  data Colours = Black | Blue | Red | White | Yellow
    deriving (Eq, Ord, Show)

  colourPairs = [(a,b) | a <- colours, b <- colours, a < b] where
    colours = [Black, Blue, Red, White, Yellow]

  {-tests-}

  prop_expected_values = colourPairs == [
    (Black, Blue), (Black, Red), (Black, White), (Black, Yellow),
    (Blue, Red), (Blue, White), (Blue, Yellow),
    (Red, White), (Red, Yellow),
    (White, Yellow)]

  prop_all_different = nub colourPairs == colourPairs

  prop_non_directed = null (intersect colourPairs [(a, b) | (b, a) <- colourPairs])

  prop_each_pair_different = null [(a, b) | (a, b) <- colourPairs, a == b]
