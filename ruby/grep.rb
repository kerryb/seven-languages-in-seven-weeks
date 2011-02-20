#!/usr/bin/env ruby

pattern, file = ARGV

File.open file do |f|
  f.each do |line|
    puts("%3d: %s" % [f.lineno, line]) if line =~ Regexp.new(pattern)
  end
end
