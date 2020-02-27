# encoding: utf-8

arry = [1, 2, 3, 4, 5]

reversed_arry = arry.reverse

puts "Исходный массив:"
p arry
puts "Массив в обратном порядке:"
p reversed_arry

puts "Исходный массив (не изменился):"
p arry

arry.reverse!

puts "Исходный массив (после изменения):"
p arry
