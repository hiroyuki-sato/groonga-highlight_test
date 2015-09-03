#!/usr/bin/env ruby 

require 'csv'

CSV.foreach("data.txt") do |row|
  print row[0],"\n" if row[-1].to_i <= 8490
end
