module StringToNumber where
  import Test.QuickCheck

  to_number s = foldl (\a b -> 10 * a + (to_digit b)) 0 (filter (\x -> elem x ['0'..'9']) s)
  to_digit c = case c of
    '1' -> 1
    '2' -> 2
    '3' -> 3
    '4' -> 4
    '5' -> 5
    '6' -> 6
    '7' -> 7
    '8' -> 8
    '9' -> 9
    otherwise -> 0

  {-tests-}

  prop_empty_is_zero = to_number "" == 0
  prop_simple_integer = to_number "123" == 123
  prop_ignore_punctuation = to_number "$123,456" == 123456
