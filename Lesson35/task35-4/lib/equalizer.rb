# encoding: utf-8

require 'open-uri'
require 'json'

class Equalizer

  URI = 'https://www.cbr-xml-daily.ru/daily_json.js'.freeze

  attr_accessor :diplomats

  def self.load_json
    begin
      doc = open(URI)
      json = JSON.load(doc)
      doc.close
    rescue OpenURI::HTTPError, SocketError # поймаем 2 ошибки подключения
    end
    json 
  end

  def self.get_rate(name, json)
    return 1 if name == 'RUB'  # если это рубль сразу вернем значение

    if !json.nil? && json["Valute"][name.chomp] # json не nil и валюта присутствует в json?
      json["Valute"][name.chomp]["Value"].round(2) # если да получим курc
    end
  end

  def initialize(diplomats)
    @diplomats = diplomats
  end

  def calculate
    diff = diff(rub_values)
    to_s(result(diff))
  end

  private
  # я не помню как я создал эту логику но она работает.
  # постараюсь вспомнить.
  def rub_values
    diplomats.map { |dipl| dipl.rate * dipl.amount } # 1. приводим к общему знаменателю
  end

  def diff(rub_values) # 2. это метод чтобы найти разницу от среднего арифметического
    mean = rub_values.sum / diplomats.size # среднее от всех валют с общим знаменателем
    diff = rub_values.map { |value| value - mean } # находим сколько не хватает каждой валюте до среднего
    diff.reject { |value| value.abs < 2 } # если сумма меньше 2 рублей - не трогаем. (Хз почему 2 рубля)
  end

  def result(diff) # 3. узнаем разницу каждой валюты в ее собственной валюте.
    diff.map.with_index { |val, indx| val / diplomats[indx].rate }
  end

  def to_s (results)
    to_buy = "Вам надо купить:" # подготовим 2 строки
    to_sell = "Вам надо продать:"

    if results.size < 2
      return "Портфели сбалансированы, редкая удача." # если результат состоит из 1 валюты - нам начего покупать или продавать.
      # эта цифра определяется в 41 строке. метод to_s результирующий. Он в любом случае дает строку и в любом случае это результат.
    end

    results.each_with_index do |value, indx|
      if value < 0 # теперь интересное. Если сумма получилась отрицательной, то значит что от среднего надо к ней прикупить.
        to_buy << "\n #{diplomats[indx].name}: #{value.abs.round(2)}"
      else # если положительной - пере, то от нее продать.
        to_sell << "\n #{diplomats[indx].name}: #{value.abs.round(2)}"
      end
    end
    to_sell << "\n" # пустые строки для красоты.
    to_buy << "\n"
    to_buy + to_sell
  end
end
