module MaybeHash (Hash, (-->), (-=>)) where
  import Test.QuickCheck

  data Hash a b = Hash [Pair a b]
  instance (Show a, Show b) => Show (Hash a b) where
    show (Hash c) = show c

  data Pair a b = Value a b | Nested a (Hash a b)
  instance (Show a, Show b) => Show (Pair a b) where
    show (Value a b) = show a ++ " --> " ++ show b
    show (Nested a b) = show a ++ " --> " ++ show b

  (-->) k v = Value k v
  (-=>) k v = Nested k v

  {-tests-}

  hash = Hash ["foo" --> 1, "bar" --> 2, "baz" -=> Hash ["quz" --> 3, "quuz" --> 4]]

  prop_show = show hash == "[\"foo\" --> 1,\"bar\" --> 2,\"baz\" --> [\"quz\" --> 3,\"quuz\" --> 4]]"
