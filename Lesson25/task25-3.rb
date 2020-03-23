# encoding: utf-8

food = {milk: 2, eggs: 10, butter: 1, banana: 3}

goods = {milk: 2, shampoo: 1, venik: 1}

products = goods.merge(food) {|_, old, new| old + new}

puts "Нужно купить:"
puts products
