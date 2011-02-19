#!/usr/bin/env ruby

number = rand(100)
until (print "Your guess? "; guess = gets.to_i) == number
  puts guess < number ? "Higher!" : "Lower!"
end
puts "Correct!"
