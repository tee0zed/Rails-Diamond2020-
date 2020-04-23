
require 'json'

path = "#{__dir__}/vizitka.json"

file = File.read(path, encoding:'utf-8')

json = JSON.parse(file)

json.each_pair do |key, val|
  puts "#{key}: #{val}"
end


