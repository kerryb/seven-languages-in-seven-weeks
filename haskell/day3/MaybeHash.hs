module MaybeHash where
  import Test.QuickCheck

  get _ [] = Nothing
  get x ((key, value):tail) = if x == key
    then Just value
    else get x tail

  {-tests-}

  hash = [("one", 1), ("two", 2)]

  prop_returns_match = get "one" hash == Just 1

  prop_missing_is_nothing = get "three" hash == Nothing
