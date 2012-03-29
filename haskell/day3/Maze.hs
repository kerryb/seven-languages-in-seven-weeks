module Maze (Maze, Node) where
  import Test.QuickCheck

  data Maze = Maze {nodes :: [Node], start :: Node, exit :: Node} deriving (Show)
  data Node = Node {x :: Int, y :: Int, exits :: [Node]} deriving (Show, Eq)

  -- The maze:
  --
  --          Exit
  --           ⬆
  -- ╔══╦══╦══╦  ╗
  -- ║d1 d2 d3║d4║
  -- ╠  ╬══╬  ╬  ╣
  -- ║c1 c2║c3 c4║
  -- ╠══╬  ╬  ╬══╣
  -- ║b1 b2║b3║b4║
  -- ╠  ╬══╬  ╬  ╣
  -- ║a1║a2 a3 a4║
  -- ╚  ╩══╩══╩══╝
  --  ⬆
  -- Start

  a1 = Node 1 1 [b1]
  a2 = Node 2 1 [a3]
  a3 = Node 3 1 [a2, a4, b3]
  a4 = Node 4 1 [a3, b4]
  b1 = Node 1 2 [a1, b2]
  b2 = Node 2 2 [b1, c2]
  b3 = Node 3 2 [a3, c3]
  b4 = Node 4 2 [a4]
  c1 = Node 1 3 [c2, d1]
  c2 = Node 2 3 [b2, c1]
  c3 = Node 3 3 [b3, d3]
  c4 = Node 4 3 [c3, d4]
  d1 = Node 1 4 [c1, d2]
  d2 = Node 2 4 [d1, d3]
  d3 = Node 3 4 [c3, d2]
  d4 = Node 4 4 [c4]

  maze = Maze [a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4] a1 d4
