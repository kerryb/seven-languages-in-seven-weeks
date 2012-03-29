module Maze (Maze, Node) where
  import Test.QuickCheck

  data Maze = Maze [Node] deriving (Show)
  data Node = Node {x :: Int, y :: Int, exits :: [Node]} deriving (Show)
