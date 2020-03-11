# encoding: utf-8

puts "Введите имя героя, чтобы посмотреть его злодея."

hero = STDIN.gets.strip.downcase

case hero
when "batman", "бэтман", "бетман"
  puts "Joker"
when "superman", "cупермен", "супермэн"
  puts "Криптонит"
when "spiderman", "человек-паук", "человек паук"
  puts "Человек-тапок"
else
  puts "Неизвестный злодей"
end
