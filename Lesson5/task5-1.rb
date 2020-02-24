# encoding: utf-8

arry = []

puts "Введите 3 числа, чтобы посчитать среднее арифметическое:"

while arry.size < 3
  puts "Введите число:"

  num = gets.strip

  while num =~ /\D/
    puts "Введите только число."
    num = gets.strip
  end

  arry << num.to_f
end

mean = arry.sum / arry.size

puts "Среднее арифметическое: #{mean}"
