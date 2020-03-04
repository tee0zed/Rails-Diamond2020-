# encoding: utf-8

INTERPRETATION = {
  [0, 15.99] => "Выраженный дефицит массы тела.",
  [16, 18.49] => "Недостаточная (дефицит) масса тела.",
  [18.5, 24.99] => "Норма.",
  [25, 29.99] => "Избыточная масса тела (предожирение).",
  [30, 34.99] => "Ожирение.",
  [35, 39.99] => "Ожирение резкое.",
  [40, 100] => "Очень резкое ожирение.",
}.freeze

def get_result(bmi)
  INTERPRETATION.each_pair do |arr, str|
   return str if bmi.between?(arr[0], arr[1])
  end
end

def get_bmi(growth, weight)
 growth = (growth/100).to_f

 (weight / growth**2).round(2)
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
puts "Введите свой рост в сантиметрах"
growth = get_input

puts
puts "Введите свой вес в килограммах."
weight = get_input

bmi = get_bmi(growth, weight)

puts
puts "Ваш BMI: #{bmi}"
puts "#{get_result(bmi)}"

