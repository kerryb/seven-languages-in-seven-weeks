module AllEven.Foldl where
  import Test.QuickCheck
  import AllEven.FromBook

  allEven :: [Integer] -> [Integer]
  allEven xs = reverse (foldl appendIfEven [] xs)
    where appendIfEven acc x = if even x then x:acc else acc

  {-tests-}
  prop_behaves_like_book_version xs = AllEven.Foldl.allEven xs == AllEven.FromBook.allEven xs
