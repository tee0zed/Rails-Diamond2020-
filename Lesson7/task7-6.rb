# encoding: utf-8

number = rand(16)

puts "Загадано число от 0 до 15, отгадайте какое?"

try = 0

3.times do |tries|

  try = gets.to_i

  break if (try == number || tries == 3)

  string = ((try - number).abs < 4 ? "Тепло." : "Холодно.")

  string << (try < number ? " Нужно больше." : " Нужно меньше.")

  puts string if tries < 2
end

if try == number
  puts "Вы победили!"
else
  puts "У вас не получилось отгадать. Это было число #{number}"
end
