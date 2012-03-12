module Sort where
  import Test.QuickCheck
  import qualified Data.List

  sort :: Ord a => [a] -> [a]
  sort [] = []
  sort (x:xs) = sort lhs ++ [x] ++ sort rhs
    where lhs = filter  (< x) xs
          rhs = filter (>= x) xs

  {-tests-}

  prop_acts_like_builtin xs = Sort.sort xs == Data.List.sort xs where
    types = xs::[Int]
