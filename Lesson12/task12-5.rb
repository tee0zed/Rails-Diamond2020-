# encoding: utf-8

require 'open-uri'
require 'json'

def random_cat_fact
  data = open("https://cat-fact.herokuapp.com/facts/random").read
  json = JSON.parse(data)

  return json["text"]
end

puts "Сколько фактов о котах вам выдать?"

input = 0

puts "Введите число."; input = gets.to_i while input == 0

input.times do
  puts
  puts random_cat_fact
end
