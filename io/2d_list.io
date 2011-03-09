#!/usr/bin/env io

Matrix := Object clone
Matrix values := nil
Matrix dim := method(x, y,
  matrix := clone
  matrix values = List clone setSize(y) map(List clone setSize(x))
  matrix
)
Matrix set := method(x, y, value,
  values at(y) atPut(x, value)
)
Matrix get := method(x, y, values at(y) at(x))
Matrix println := method(values map(join(", ") println))

matrix := Matrix dim(3,3)
matrix set(0, 0, "Top left")
matrix set(2, 0, "Top right")
matrix set(1, 1, "Middle")
matrix set(0, 2, "Bottom left")
matrix set(2, 2, "Bottom right")

"Element at 0, 0 is: " print
matrix get(0, 0) println
matrix println
