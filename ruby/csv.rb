#!/usr/bin/env ruby

module ActsAsCsv
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      filename = self.class.to_s.downcase + ".txt"
      File.open filename do |file|
        @headers = file.gets.chomp.split(", ")
        @csv_contents = file.map {|row| row.chomp.split(", ") }
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
end

m = RubyCsv.new
p m.headers
p m.csv_contents
