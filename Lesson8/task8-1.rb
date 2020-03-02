# encoding: utf-8

string = gets.downcase.gsub(/[^a-z]/, '')

reversed = string.reverse

if string == reversed
  puts "Это палиндром!"
else
  puts "Это не палиндром."
end
