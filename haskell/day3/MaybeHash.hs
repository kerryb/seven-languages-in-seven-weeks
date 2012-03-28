module MaybeHash (Hash, (-->), (-=>), fetch) where
  import Test.QuickCheck

  data Hash a b = Hash [Pair a b] deriving (Eq)
  instance (Show a, Show b) => Show (Hash a b) where
    show (Hash c) = show c

  data Pair a b = Value a b | Nested a (Hash a b) deriving (Eq)
  instance (Show a, Show b) => Show (Pair a b) where
    show (Value a b) = show a ++ " --> " ++ show b
    show (Nested a b) = show a ++ " --> " ++ show b

  (-->) k v = Value k v
  (-=>) k v = Nested k (Hash v)

  fetch :: (Eq a) => a -> Hash a b -> Maybe (Either (Hash a b) b)
  fetch _ (Hash []) = Nothing
  fetch k (Hash ((Value k1 v):t)) = if k == k1
    then Just $ Right v
    else fetch k (Hash t)
  fetch k (Hash ((Nested k1 v):t)) = if k == k1
    then Just $ Left v
    else fetch k (Hash t)

  {-tests-}

  hash = Hash ["foo" --> 1, "bar" --> 2, "baz" -=> ["quz" --> 3, "quuz" --> 4]]

  prop_show = show hash == "[\"foo\" --> 1,\"bar\" --> 2,\"baz\" --> [\"quz\" --> 3,\"quuz\" --> 4]]"
  prop_fetch_top_level = fetch "foo" hash == Just (Right 1)
  prop_fetch_top_level_missing = fetch "wibble" hash == Nothing
