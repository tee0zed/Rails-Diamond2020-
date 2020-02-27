# encoding: utf-8

arry = []

x = 1

puts "Введите N"

n = gets.to_i

while n == 0 || n < 0
  n = gets.to_i
  puts "Введите число"
end

n.times do
  arry << rand(100)+1
end

biggest = arry.max
puts "Массив: #{arry} \nСамое большое число #{biggest}"
