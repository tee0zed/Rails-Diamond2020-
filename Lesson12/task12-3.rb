# encoding: utf-8

def get_sum_to_buy(rub_amount, dol_amount, current_dol_rate)
  dol_to_rub = dol_amount * current_dol_rate

  difference = ((dol_to_rub - rub_amount).abs / 2).round(2)

  if difference < current_dol_rate * 0.01
    "Портфели сбалансированы."
  elsif rub_amount > dol_to_rub
    "Вам нужно продать #{difference} Р."
  else
    "Вам нужно купить #{difference} Р."
  end
end

def get_input
  input = gets.to_f

  while input == 0
    puts "Введите только число."
    input = gets.to_f
  end
  input
end

puts
puts "Курс доллара?"
current_dol_rate = get_input

puts
puts "Сколько у вас рублей?"
rub_amount = get_input

puts
puts "Сколько у вас долларов?"
dol_amount = get_input

result = get_sum_to_buy(rub_amount, dol_amount, current_dol_rate)

puts result
