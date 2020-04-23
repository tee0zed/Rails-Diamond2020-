
require 'json'

path = "#{__dir__}/programmers.json"

file = File.read(path, encode:'r')

doc = JSON.parse(file)

sorted_hash = doc.sort_by{|key, val| val}.reverse!.to_h

sorted_hash.each do |key, val|
  puts "#{sorted_hash.keys.index(key)+1} #{key} (#{val})"
end
