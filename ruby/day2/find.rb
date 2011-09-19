#!/usr/bin/env ruby

# without blocks:
f = File.open __FILE__
f.each_line {|l| puts l }
f.close # Easy to forget. What if there's an exception?

# with blocks:
File.open __FILE__ do |f|
  f.each_line {|l| puts l }
end

hash = {:foo => 123, :bar => 456}
array = hash.to_a
puts "As an array: #{array.inspect}"

# Possibly the ugliest ruby idiom in the world.
hash_again = Hash[*(array.flatten)]
puts "As a hash again: #{hash.inspect}"

hash.each {|k, v| puts "The value of #{k.inspect} is #{v.inspect}" }

# Array as queue:
queue = []
%w{foo bar baz}.each {|a| queue.unshift a }
3.times { puts queue.pop }

# Array as linked list
