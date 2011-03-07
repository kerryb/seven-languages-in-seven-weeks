#!/usr/bin/env io

List myAverage := method(
  if(map(isKindOf(Number)) reduce(and),
    if(size == 0, 0, reduce(+) / size),
    Exception raise(Error, "All elements must be numbers")
  )
)

"Average of 1, 2, 3, 4, 5, 6 is " print
list(1,2,3,4,5,6) myAverage println

"Average of empty list is " print
list() myAverage println

"Average of 1, 2, foo, 4 is " print
list(1, 2, "foo", 4) myAverage println
