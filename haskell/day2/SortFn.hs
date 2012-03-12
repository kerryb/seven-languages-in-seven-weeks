module SortFn where
  import Test.QuickCheck
  import qualified Data.List

  sort [] _ = []
  sort (x:xs) f = sort lhs f ++ [x] ++ sort rhs f
    where lhs = filter  (f x) xs
          rhs = filter (not . f x) xs

  {-tests-}

  prop_sorts_by_function xs = SortFn.sort xs f == reverse (Data.List.sort xs) where
    f x y = x < y
    types = xs::[Int]

  prop_acts_like_builtin xs = SortFn.sort xs f == Data.List.sortBy f' xs where
    f x y = length x >= length y
    f' x y
      | length x < length y = LT
      | otherwise = GT
    types = xs::[[Char]]
