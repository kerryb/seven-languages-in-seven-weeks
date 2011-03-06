#!/usr/bin/env io

fib := method(n, 
  last := 0
  current := 1
  for(a, 1, n,
    next := current + last
    last = current
    current = next
  )
  last
)

for(n, 1, 10, fib(n) println)

fib = method(n, 
  if(n <= 2, 1, fib(n - 1) + fib(n - 2))
)

for(n, 1, 10, fib(n) println)
