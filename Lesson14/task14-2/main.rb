# encoding: utf-8

require_relative './lib/test'

puts "Как вас зовут?"

name = STDIN.gets.chomp

test = Test.new(name)

test.test_start

sleep 1
puts test.get_result
