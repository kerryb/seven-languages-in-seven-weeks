module AllEven.Guards where
  import Test.QuickCheck
  import Data.List
  import AllEven.FromBook

  allEven :: [Integer] -> [Integer]
  allEven [] = []
  allEven (h:t)
    | even h = h:AllEven.Guards.allEven t
    | otherwise = AllEven.Guards.allEven t

  {-tests-}
  prop_behaves_like_book_version xs = AllEven.Guards.allEven xs == AllEven.FromBook.allEven xs
