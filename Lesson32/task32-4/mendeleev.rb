# frozen_string_literal: true
require 'json'

path = "#{__dir__}/elements.json"

file = File.read(path, encode: 'utf-8')

doc = JSON.parse(file)

puts "Here all elements we have:"

doc.keys.each { |el| print " #{el} " }

puts
puts 'Which element you need information about?'

element = STDIN.gets.chomp.capitalize

if doc.keys.include?(element)
  doc[element].each { |key, val| puts "#{key}: #{val}" }
else
  puts "We do not have such element, sorry."
end
