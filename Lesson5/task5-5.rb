# encoding: utf-8

require 'json'
require 'open-uri'

def load_json
  begin
    doc = open('https://www.cbr-xml-daily.ru/daily_json.js')
    json = JSON.load(doc)
    doc.close
  rescue OpenURI::HTTPError, SocketError # поймаем 2 ошибки подключения
  end
  json
end

def get_amount
  amount = 0
  while amount == 0
    puts "Введите только число."
    amount = gets.to_f
  end
  amount
end

json = load_json

if json.nil?
  puts
  puts "Не удалось загрузить курс доллара."
  current_rate = get_amount
else
  current_rate = json["Valute"]["USD"]["Value"].round(2)
end

puts "Сколько у вас рублей?"

rub_amount = get_amount

puts "Сколько у вас долларов?"

dol_amount = get_amount

# Приводим обе суммы к одному знаменателю. В этом случае рубли.
dol_to_rub = dol_amount * current_rate
# Найдем абсолютную разницу в рублях которая пригодится нам позже.
difference = (dol_to_rub - rub_amount).abs / 2

# Если портфели равны или разница меньше одного цента.
if difference <= 0.01 * current_rate
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
