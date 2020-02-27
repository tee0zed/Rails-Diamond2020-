# encoding: utf-8

number = rand(16)

puts "Загадано число от 0 до 15, отгадайте какое?"

3.times do
  try = gets.strip

  while try =~ /\D/
    puts "Введите только числа."
    try = gets.strip
  end

  try = try.to_i

  if try == number
    puts "Вы отгадали!"
    exit
  elsif (number - try).abs < 4
    if try < number
      puts "Тепло (нужно больше)"
    else
      puts "Тепло (нужно меньше)"
    end
  else
    if try < number
      puts "Холодно (нужно боьше)"
    else
      puts "Холодно (нужно меньше)"
    end
  end
end

puts "У вас не получилось отгадать. Это было число #{number}"
