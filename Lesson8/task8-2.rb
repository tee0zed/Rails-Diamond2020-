# encoding: utf-8

puts "Введите строку, чтобы проверить на палиндромность."

string = gets.downcase.gsub(/[^a-zа-я]/, '')

reversed = string.reverse

if string == reversed
  puts "Это палиндром!"
else
  puts "Это не палиндром."
end
