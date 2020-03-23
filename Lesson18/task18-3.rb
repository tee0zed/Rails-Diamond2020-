# encoding: utf-8

hashtag_regexp = /#[[:word:]-]+/

puts 'Введите текст:'
string = gets.encode('UTF-8').chomp

hashtags = string.scan(hashtag_regexp)


puts
puts "Нашли вот такие хэштеги: " + hashtags.join(", ")
