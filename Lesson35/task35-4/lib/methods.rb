# encoding: utf-8

def get_amount
  input = gets.to_f
  while input == 0
    puts "Введите только число в формате 0.00"
    input = gets.to_f
  end
  input
end

def get_name
  currency = gets.strip.upcase
  until currency =~ /^[a-z,A-Z]{3}$/
    puts "Введите например \'USD\'"
    currency = gets.strip.upcase
  end
  currency
end
