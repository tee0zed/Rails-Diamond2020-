# encoding: utf-8

temp = ARGV[0]

season = ARGV[1]

puts "Узнаем поют ли сейчас соловьи."

until temp =~ /[0-9]/
  puts "Какая на улице температура?"
  temp = STDIN.gets
end

until season =~ /[0-3]/
  puts "Какое сейчас время года?
  0-весна
  1-лето
  2-осень
  3-зима"
  season = STDIN.gets
end

season = season.to_i

temp = temp.to_i

if (season == 1 && [*15..35].include?(temp)) ||
  [*22..30].include?(temp)
  puts "Быстрее в парк! Соловьи уже поют."
elsif
  puts "Соловьи не поют."
end
