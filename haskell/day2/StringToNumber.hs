module StringToNumber where
  import Test.QuickCheck

  to_number :: [Char] -> Double
  to_number s = number / 10 ** (fromIntegral decimal_places) where
    number = foldl (\a b -> 10 * a + (to_digit b)) 0 digits
    decimal_places = if '.' `elem` s
      then length (takeWhile (/= '.') (reverse s))
      else 0
    digits = (filter is_digit s)
    is_digit = (\x -> elem x ['0'..'9'])
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
  prop_supports_decimals = to_number "123.456" == 123.456
  prop_handles_zeroes = to_number "0001230.0450" == 1230.045
  prop_all_at_once = to_number "£12,000.99" == 12000.99
