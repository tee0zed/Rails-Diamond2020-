# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

path = __dir__ + '/data/'

collection = ProductCollection.from_dir(path)

collection.sort!(by: :title)

products = collection.to_a

input = nil

total_price = 0

cart = []

# цикл покупки
until input == 0
  puts "-----------------------------------"
  puts "Вот что у нас есть:
нажмите 0 для выхода."
  puts
  puts collection

  input = STDIN.gets.to_i

  if input.between?(1, products.size)
    product = products[input-1]

    buy = product.buy

    if buy
      total_price += buy
      cart << product.to_s
    else
      puts "+++++++++++++++++++++++++++++++++++"
      puts "Нет такого количества."
      puts "+++++++++++++++++++++++++++++++++++"
    end

    puts
    puts "-----------------------------------"
    puts "В корзине:"
    puts cart
    puts
  elsif input != 0 && input
    puts
    puts
    puts "Такого товара нет."
  end
end

puts "Спасибо за покупки, с Вас #{total_price} руб."
