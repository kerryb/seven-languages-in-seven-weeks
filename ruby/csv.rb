#!/usr/bin/env ruby

module ActsAsCsv
  def self.included base
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

    def each &block
      csv_contents.map {|row| CsvRow.new headers, row}.each &block
    end

    class CsvRow
      def initialize headers, row
        @values = Hash[*(headers.zip(row).flatten)]
      end

      def method_missing name
        @values[name.to_s]
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
end

csv = RubyCsv.new
p csv.headers
p csv.csv_contents

puts

csv.each {|row| puts row.one}
