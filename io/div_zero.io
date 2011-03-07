#!/usr/bin/env io

"Before:" println
"6 / 2 = " print
(6 / 2) println
"2 / 0 = " print
(2 / 0) println

Number oldDiv := Number getSlot("/")
Number / = method(n, if(n == 0, 0, oldDiv(n)))

"After:" println
"6 / 2 = " print
(6 / 2) println
"2 / 0 = " print
(2 / 0) println
