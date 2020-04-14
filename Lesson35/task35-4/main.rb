# encoding: utf-8

require_relative 'lib/equalizer'
require_relative 'lib/currency_diplomat'
require_relative 'lib/methods'

puts "Будьте готовы ввести актуальные курсы ваших валют и размеры валютных портфелей."

json = Equalizer.load_json
# метод вернет nil если по какой то ошибке json не подгрузится
puts; puts "Не удалось загрузить курсы валют." if json.nil?

input = 1

diplomats = []

while input == 1
  puts
  puts "Введите 3-х значное обозначение вашей валюты на латиннице"

  name = get_name
  puts
  puts "Сколько её у вас?"

  amount = get_amount

  rate = Equalizer.get_rate(name, json)

  if rate.nil? # если rate не нашел такое значение в json или json - nil
    puts
    puts "Введите её курс"
    rate = get_amount
  end

  diplomats.push CurrencyDiplomat.new(amount, rate, name)

  puts "Если вы закончили нажмите enter, чтобы ввести еще - 1."
  input = gets.to_i
end

session = Equalizer.new(diplomats)

if session.diplomats.count <= 1
  puts "Нужно ввести больше 1 валюты."
  sleep 1
  exit
end

puts session.calculate
