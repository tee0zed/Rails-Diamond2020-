# encoding: utf-8

array =
(1..100).map do |num|
  if num % 15 == 0
    "тыры-пыры"
  elsif num % 5 == 0
    "пыры"
  elsif num % 3 == 0
    "тыры"
  else
    num
  end
end

