# encoding: utf-8

puts "Курс доллара?"

current_rate = gets.chomp.strip.to_f

while current_rate == 0
  puts "Введите только число."
  current_rate = gets.to_f
end

puts "Сколько у вас рублей?"

rub_ammount = gets.to_f

while rub_ammount == 0
  puts "Введите только число."
  rub_ammount = gets.to_f
end

puts "Сколько у вас долларов?"

dol_ammount = gets.to_f

while dol_ammount == 0
  puts "Введите только число."
  dol_ammount = gets.to_f
end

#Приводим обе суммы к одному знаменателю. В этом случае рубли.
dol_to_rub = (dol_ammount * current_rate).round(2)

#Если портфели равны.
if rub_ammount == dol_to_rub
  puts "Perfectly balanced as all things should be..."

#Если рублевый портфель оказывается больше
elsif rub_ammount > dol_to_rub
  #находим разницу, делим пополам на два потрфеля
  difference = (rub_ammount - dol_to_rub) / 2
  #и выясняем количество долларов которое нужно докупить
  sum_to_buy = difference / current_rate
  #округляем до центов.
  puts "Вам надо купить #{sum_to_buy.round(2)}$"

#Еcли больше долларовый
elsif rub_ammount < dol_to_rub
  #так же ищем разницу и делим пополам,
  sum_to_buy = (dol_to_rub - rub_ammount) / 2
  #но в этот раз сумма нам нужна в рублях, так же округляем до сотых.
  puts "Вам надо купить #{sum_to_buy.round(2)} Р"
end
