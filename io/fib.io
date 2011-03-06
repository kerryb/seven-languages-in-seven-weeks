#!/usr/bin/env io

fib := method(n, 
  last := 0
  current := 1
  for(a, 1, n,
    current println
    next := current + last
    last = current
    current = next
  )
  current
)

fib(10) println
