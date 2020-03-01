puts "How much money do you need to stay per month?"
need_per_month = gets.strip.to_i

while need_per_month == 0
  puts "Please check your expected income"
  need_per_month = gets.strip.to_i
end

puts "How much can you save per month?"
can_save = gets.strip.to_i

while can_save == 0
  puts "Please check your expected savings"
  can_save = gets.strip.to_i
end

interest_rate = 0.05

# Сколько лет потребуется
years = (need_per_month * 240 / can_save).round

# Капитализация процентов
capitalization = 0
years.times { |i| capitalization += interest_rate**i }

# Расчет количества лет и месяцев с учетом капитализации
years_exact = (years / capitalization / 12).to_i
months_exact  = (years - years_exact) % 12

# Выбор ед/множественного числа для слова month
print_months = months_exact == 1 ? "month" : "months"

if years_exact == 1
  if months_exact == 0
    puts "You need to save for 1 year"
  else
    puts "You need to save for 1 year and #{months_exact} #{print_months}"
  end
elsif years_exact == 0
  puts "You need to save for #{months_exact} #{print_months}"
else
  puts "You need to save #{years_exact} years and #{months_exact} #{print_months}"
end
