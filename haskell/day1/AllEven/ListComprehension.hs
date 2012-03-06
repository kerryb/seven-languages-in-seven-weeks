module AllEven.ListComprehension where
  import Test.QuickCheck
  import AllEven.FromBook

  allEven :: [Integer] -> [Integer]
  allEven xs = [x | x <- xs, even x]

  {-tests-}
  prop_behaves_like_book_version xs = AllEven.ListComprehension.allEven xs == AllEven.FromBook.allEven xs
