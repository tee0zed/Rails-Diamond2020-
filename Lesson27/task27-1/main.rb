# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require 'byebug'

path = __dir__ + '/data/'

collection = ProductCollection.from_dir(path)
# метод принимает параметрами 3 символа - порядок(asc: true/false),
# сортировка по (by: amount, price, title) и группировка по классам (group?: true/false)
# метод может не принимать параметры, тогда группировка происходит по типу, названию и
# в порядке возрастания.
collection.sort!(group?: true, by: :title)

# получим массив товаров без строчек-сепараторов
products_array = collection.sort_result.reject {|obj| obj.is_a? String}


puts "Вот что у нас есть:"
puts



shopped = []

input = nil

until input == 0
  puts "\n\nВ корзине:\n"

  shopped.each do |item|
    puts products_array[item-1].to_str
  end

  puts
  puts collection.to_str
  puts "\n*****\n0 - оплатить и выйти.
  \nВыберите покупку"

  input = gets.to_i
  shopped << input
end

sum = 0

puts "Вы купили:"
shopped.each do |item|
  sum += products_array[item-1].price

  products_array[item-1].amount -= 1

  puts products_array[item-1].to_str
end

puts "С вас: #{sum} рублей."



