#!/usr/bin/env ruby

array = (1..16).to_a

count = 0
array.each do |element|
  print "#{element} "
  puts if count == 3
  count = (count + 1) % 4
end

puts "----------"

array.each_slice(4) do |subarray|
  puts subarray.join " "
end
