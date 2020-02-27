# encoding: utf-8

puts "Курс доллара?"

current_rate = gets.chomp.strip.to_f

while current_rate == 0
  puts "Введите только число."
  current_rate = gets.to_f
end

puts "Сколько у вас рублей?"

rub_amount = gets.to_f

while rub_amount == 0
  puts "Введите только число."
  rub_amount = gets.to_f
end

puts "Сколько у вас долларов?"

dol_amount = gets.to_f

while dol_amount == 0
  puts "Введите только число."
  dol_amount = gets.to_f
end

# Приводим обе суммы к одному знаменателю. В этом случае рубли.
dol_to_rub = dol_amount * current_rate
# Найдем абсолютную разницу в рублях которая пригодится нам позже.
difference = (dol_to_rub - rub_amount).abs / 2

# Если портфели равны или разница меньше одного цента.
if difference < current_rate * 0.01
  puts "Perfectly balanced as all things should be..."
# Если рублевый портфель оказывается больше
elsif rub_amount > dol_to_rub
  # и выясняем количество долларов которое нужно докупить
  sum_to_buy = difference / current_rate
  # округляем до центов и проверяем погрешность чтобы программа не давала
  # вывод puts в случае, если погрешность меньше цента, но все же больше нуля.
  puts "Вам надо купить #{sum_to_buy.round(2)}$"
# Еcли больше долларовый
else
  # просто берем разницу в рублях.
  puts "Вам надо купить #{difference.round(2)} Р"
end
