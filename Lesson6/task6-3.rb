# encoding: utf-8

cars = %w(toyota mercedes bmw hyndai honda lada uaz skoda suzuki audi citroen)

puts "У нас есть такие машины:"

cars.each_with_index do |car, index|
  puts "#{index+1} #{car}"
end

puts "Какую вы бы хотели?"

choice = gets.to_i

until (0..cars.size).to_a.include?(choice)
  puts "Такой машины нету!"
  choice = gets.to_i
end

puts "Вот ваша машина: #{cars[choice-1]}"
