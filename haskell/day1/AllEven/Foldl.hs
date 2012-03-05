module AllEven.Foldl where
  import Test.QuickCheck
  import Data.List

  allEven :: [Integer] -> [Integer]
  allEven xs = reverse (foldl appendIfEven [] xs)
    where appendIfEven acc x = if even x then x:acc else acc

  {-tests-}
  prop_selected_all_even xs = all even (allEven xs)
  prop_rejected_all_odd xs = all odd (xs \\ allEven xs)
  prop_retains_order xs = (xs \\ (xs \\ allEven xs)) == allEven xs
