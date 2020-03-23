# encoding: utf-8

phone_regexp = /^([+\-\ 0-9()]+)$/

puts 'Введите телефон:'
user_input = gets.encode('UTF-8').chomp

if user_input.match(phone_regexp)
  puts 'Спасибо!'
else
  puts 'Это не телефон'
end
