#!/usr/bin/env io

number := Random value(100) ceil
closeness := 1 / 0
for(guesses_remaining, 10, 1, -1,
  guess := File standardInput readLine("Guess the number (#{guesses_remaining} attempts left): " interpolate) asNumber
  if(guess == number,
    "You got it!" println; return,
    "No, it's not #{guess}, " interpolate print
    new_closeness := (guess - number) abs
    if(new_closeness < closeness, "but you're getting warmer", "and you're getting colder") println
    closeness = new_closeness
  )
)
"Sorry, the number was #{number}.\n" interpolate println
