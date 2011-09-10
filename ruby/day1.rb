#!/usr/bin/env ruby

puts "Hello, world."

puts "Index is #{"Hello, Ruby".index("Ruby")}"

10.times { puts "Kerry" }

(1..10).each {|n| puts "This is sentence number #{n}" }

number = rand(100)
loop do
  print "Your guess? "
  case gets.to_i
  when number then
    puts "Correct!"
    break
  when (0...number) then puts "Higher!"
  else puts "Lower!"
  end
end
