#!/usr/bin/env io

Matrix := Object clone
Matrix values := list()
Matrix dim := method(x, y,
  matrix := clone
  matrix values = List clone setSize(y) map(List clone setSize(x))
  matrix
)
Matrix set := method(x, y, value,
  values at(y) atPut(x, value)
)
Matrix get := method(x, y, values at(y) at(x))
Matrix asString := method(values map(join(", ")) join("\n"))

matrix := Matrix dim(3,3)
matrix set(0, 0, "NW")
matrix set(1, 0, "N")
matrix set(2, 0, "NE")
matrix set(0, 1, "W")
matrix set(1, 1, "C")
matrix set(2, 1, "E")
matrix set(0, 2, "SW")
matrix set(1, 2, "S")
matrix set(2, 2, "SE")

"Element at 0, 0 is: " print
matrix get(0, 0) println
"" println
matrix println
