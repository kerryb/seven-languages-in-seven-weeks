module AllEven.FromBook where
  import Test.QuickCheck
  import Data.List

  allEven :: [Integer] -> [Integer]
  allEven [] = []
  allEven (h:t) = if even h then h:allEven t else allEven t

  {-tests-}
  prop_selected_all_even xs = all even (allEven xs)
  prop_rejected_all_odd xs = all odd (xs \\ allEven xs)
