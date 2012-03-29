module MaybeHash (Hash, (-->), (-=>), fetch, fetch') where
  import Test.QuickCheck

  data Hash a b = Hash [Pair a b] deriving (Eq)
  instance (Show a, Show b) => Show (Hash a b) where
    show (Hash c) = show c

  data Pair a b = Value a b | Nested a (Hash a b) deriving (Eq)
  instance (Show a, Show b) => Show (Pair a b) where
    show (Value a b) = show a ++ " --> " ++ show b
    show (Nested a b) = show a ++ " -=> " ++ show b

  -- Can't work out how to combine these two operators
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

  -- Need to call this one for nested fetches, because the first fetch wraps the
  -- returned sub-hash in a Left. Couldn't figure out how to make the same
  -- function work for both.
  fetch' k (Left h) = fetch k h

  -- tests

  hash = Hash ["foo" --> 1, "bar" --> 2, "baz" -=> ["quz" -=> ["quuz" --> 3]]]

  prop_show = show hash ==
    "[\"foo\" --> 1,\"bar\" --> 2,\"baz\" -=> [\"quz\" -=> [\"quuz\" --> 3]]]"

  prop_fetch_top_level = fetch "foo" hash
    == Just (Right 1)

  prop_fetch_top_level_monad = (Just hash >>= fetch "foo" >>= return)
    == Just (Right 1)

  prop_fetch_top_level_missing = fetch "wibble" hash == Nothing

  prop_fetch_nested =
    (Just hash >>= fetch "baz" >>= fetch' "quz" >>= fetch' "quuz" >>= return)
    == Just (Right 3)
