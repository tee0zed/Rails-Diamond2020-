# encoding: utf-8

puts "Сколько сейчас стоит 1 доллар в рублях?"

current_rate = gets.chomp.strip.to_f

while current_rate == 0
  puts "Введите только число."
  current_rate = gets.chomp.strip.to_i
end

puts "Сколько у вас рублей?"

ammount = gets.chomp.strip.to_i

while ammount == 0
  puts "Введите только число."
  ammount = gets.chomp.strip.to_i
end

result = ammount / current_rate

puts "Ваши запасы равны: $ #{result.round(2)}"
