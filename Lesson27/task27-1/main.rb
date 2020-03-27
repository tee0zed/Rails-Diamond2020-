# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

path = __dir__ + '/data/'

collection = ProductCollection.from_dir(path)
# метод принимает параметрами 3 символа - порядок(asc: true/false),
# сортировка по (by: amount, price, title) и группировка по классам (group?: true/false)
# метод может не принимать параметры, тогда группировка происходит по типу, названию и
# в порядке возрастания.
collection.sort!(group?: true, by: :title)

# получим массив товаров без строчек-сепараторов, на случай если они присутствуют.
products_array = collection.sort_result.reject {|obj| obj.is_a? String}


puts "Вот что у нас есть:"
puts

shopped = []

input = nil

until input == 0
  puts
  puts collection.to_str

  puts "
\n\n*****

0 - оплатить и выйти.

Выберите покупку.
"

  puts "\n\nВ корзине:\n"

  shopped.each do |item|
    item -= 1

    begin
    products_array[item].amount -= 1

    puts products_array[item].to_str
    rescue NoMethodError
      puts "Такого товара нет!"
    end
  end

  input = STDIN.gets.to_i
  shopped << input unless input == 0
end

sum = 0

puts "\nВы купили:"

shopped.each do |item|
  item -= 1

  begin
  sum += products_array[item].price

  puts products_array[item].to_str
  rescue NoMethodError
  end
end

puts "С вас: #{sum} рублей."
