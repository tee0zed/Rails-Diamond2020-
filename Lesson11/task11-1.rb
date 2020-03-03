# encoding: utf-8

include Math

def circle_area(r)
  (Math::PI*r**2).floor(2)
end

puts "Введите радиус круга"

input = gets.to_i

while input == 0
  puts "Введите радиус круга."
  input = STDIN.gets.to_i
end

puts circle_area(input)
