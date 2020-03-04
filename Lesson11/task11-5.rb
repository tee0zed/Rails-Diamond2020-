# encoding: utf-8

def give_me_da_animul(num, kot, kota, kotov)
  num = num.to_i unless num.is_a?(Integer)

  digit = num % 10

  if num.digits[1] == 1
    kotov
  elsif digit == 1
    kot
  elsif digit.between?(2, 4)
    kota
  else
    kotov
  end
end

puts "Сколько вам жирафов?"

input = gets.to_i

while input == 0
  puts "Нужен хотя бы один!"
  input = STDIN.gets.to_i
end

puts "Вот #{input} #{give_me_da_animul(input, 'жираф', 'жирафа', 'жирафов')}!"
