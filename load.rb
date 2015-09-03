#!/usr/bin/env ruby 

require 'groonga'
require 'csv'

Groonga::Database.open("database/data.db")

data_table = Groonga["Data"]

entry_num = 0
1.upto(30) do 
  CSV.foreach("data/single.txt").each_with_index do |row,idx|
    entry_num += 1
    article = row[0]
    line_no = idx + 1
    data_table.add(entry_num.to_s, {'line_no' => line_no,
                                    'article' => article })
  end
end
