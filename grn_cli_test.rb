#!/usr/bin/env ruby

require 'groonga/client'
require 'pp'

q = "( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<300)"


cli = Groonga::Client.new({ :host => '127.0.0.1',
                      :port => 10041,
                      :protocol => 'http',
                      :read_timeout => 100 })
#pp cli
puts Time.new
begin
  res = cli.select({ :table => 'Data',
               :query => q,
               :match_columns => "article",
               :output_columns => "_key,highlight_html(article),line_no",
               :command_version => 2,
               :limit => -1 })
  puts "End select #{Time.new}"
  if( res.kind_of?(Groonga::Client::Response::Error) )
    puts $!.to_s
    exit 1
  end
  res.records.each do |a|
    puts a
  end
  puts "End output #{Time.new}"
rescue
  puts $!
  puts $!.backtrace
  puts "Exception #{Time.new}"
end
