module AllEven.Foldr where
  import Test.QuickCheck
  import AllEven.FromBook

  allEven :: [Integer] -> [Integer]
  allEven xs = foldr appendIfEven [] xs
    where appendIfEven x acc = if even x then x:acc else acc

  {-tests-}
  prop_behaves_like_book_version xs = AllEven.Foldr.allEven xs == AllEven.FromBook.allEven xs
