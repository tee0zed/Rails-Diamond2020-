# encoding: utf-8

require 'open-uri'
require 'json'

require_relative 'lib/equalizer'
require_relative 'lib/currency_diplomat'

def get_amount
  input = gets.to_f
  while input == 0
    puts "Введите только число в формате 0.00"
    input = gets.to_f
  end
  input
end

def get_name
  currency = gets.strip
  until currency =~ /^[a-z]{3}$/
    puts "Введите например \'usd\'"
    currency = gets.strip
  end
  currency
end

puts "Будьте готовы ввести актуальные курсы ваших валют и размеры валютных портфелей."

begin
  json = JSON.load(open('https://www.cbr-xml-daily.ru/daily_json.js'))
rescue OpenURI::HTTPError
  puts
  puts "Не удалось загрузить курсы валют."
  json = nil
end

input = 1

diplomats = []

while input == 1
  puts
  puts "Введите 3-х значное обозначение вашей валюты на латиннице"

  name = get_name
  puts
  puts "Сколько её у вас?"

  amount = get_amount

  if name == 'rub'
    rate = 1
  elsif json
    rate = json["Valute"][name.upcase.chomp]["Value"].round(2)
  else
    puts
    puts "Введите её стоимость в рублях."
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
