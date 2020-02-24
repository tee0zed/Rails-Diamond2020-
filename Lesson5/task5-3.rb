# encoding: utf-8

puts "Какая у вас на руках валюта?"
puts "1 - Рубли"
puts "2 - Доллары"

choice = gets.to_i

until choice == 1 || choice == 2
  puts "Введите только число."
  choice = gets.to_i
end

puts "Сколько сейчас стоит 1 доллар в рублях?"

current_rate = gets.chomp.strip.to_f

while current_rate == 0
  puts "Введите только число."
  current_rate = gets.to_f
end

if choice == 1
  puts "Сколько у вас рублей?"

  ammount = gets.to_i

  while ammount == 0
    puts "Введите только число."
    ammount = gets.to_i
  end

  result = ammount / current_rate

  puts "Ваши запасы равны: $ #{result.round(2)}"
elsif choice == 2
  puts "Сколько у вас долларов?"

  ammount = gets.to_i

  while ammount == 0
    puts "Введите только число."
    ammount = gets.to_i
  end

  result = ammount * current_rate

  puts "Ваши запасы равны: Р #{result.round(2)}"
end
