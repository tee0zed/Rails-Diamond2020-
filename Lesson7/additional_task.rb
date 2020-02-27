# encoding: utf-8

current_dep = 0

month_count = 0

income = 0

puts "Это программа подсчитает срок на который вам нужно сделать вклад чтобы получать желаемую сумму ежемесячно."

puts "Какая сумма вас устроила бы ежемесячно?
Вводите сумму в рублях, без копеек."

desired_sum = gets.to_f

while desired_sum <= 0
  desired_sum = gets.to_f
  puts "Вводите сумму в рублях, без копеек."
end

puts "Какую сумму в месяц вы были бы готовы вносить на депозит?
Вводите сумму в рублях, без копеек."

month_deposit = gets.to_f

while month_deposit <= 0
  month_deposit = gets.to_f
  puts "Вводите сумму в рублях, без копеек."
end

# Наш коэффициент в процентах:
interest = 0.05

until income >= desired_sum
  current_dep += month_deposit
  month_count += 1
  # Из-за того что банки считают одним месяцем 30 дней, а годом 365 -
  # просто взять и поделить на 12 не выходит, тогда:
  current_dep = current_dep + (current_dep * interest * 30.0) / 365.0
  current_dep = current_dep.round(2)
  # Посчитаем какую прибыль мы получаем в следующем месяце
  income = (current_dep * interest * 30.0) / 365.0
end

puts "\nВам потребуется #{month_count / 12} год(а)/лет и #{month_count % 12} месяц(а/ев),
а к этому времени на вкладе будет #{current_dep} рублей."
