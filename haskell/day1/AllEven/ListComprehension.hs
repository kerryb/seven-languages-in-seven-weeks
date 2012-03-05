module AllEven.FromBook where
  import Test.QuickCheck
  import Data.List

  allEven :: [Integer] -> [Integer]
  allEven xs = [x | x <- xs, even x]

  {-tests-}
  prop_selected_all_even xs = all even (allEven xs)
  prop_rejected_all_odd xs = all odd (xs \\ allEven xs)
  prop_retains_order xs = (xs \\ (xs \\ allEven xs)) == allEven xs
