# encoding: utf-8

arry = []

x = 1

puts "Введите N"

n = gets.to_i

while  n <= 0
  n = gets.to_i
  puts "Введите число"
end

n.times do
  arry << x
  x += 1
end

sum = arry.reduce(:+)
puts "Массив: #{arry} Сумма:#{sum}"
