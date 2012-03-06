module Colours where
  import Test.QuickCheck
  import Data.List

  data Colours = Black | Blue | Red | White | Yellow
    deriving (Eq, Ord, Show)

  colour_pairs = [(a,b) | a <- colours, b <- colours, a < b] where
    colours = [Black, Blue, Red, White, Yellow]

  {-tests-}

  prop_expected_values = colour_pairs == [
    (Black, Blue), (Black, Red), (Black, White), (Black, Yellow),
    (Blue, Red), (Blue, White), (Blue, Yellow),
    (Red, White), (Red, Yellow),
    (White, Yellow)]

  prop_all_different = nub colour_pairs == colour_pairs

  prop_non_directed = null (intersect colour_pairs [(a, b) | (b, a) <- colour_pairs])

  prop_each_pair_different = null [(a, b) | (a, b) <- colour_pairs, a == b]
