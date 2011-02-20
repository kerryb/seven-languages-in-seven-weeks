#!/usr/bin/env ruby

pattern, file = ARGV

File.open file, "r" do |f|
  while line = f.gets do
    puts("%3d: %s" % [f.lineno, line]) if line =~ Regexp.new(pattern)
  end
end
