# encoding: utf-8

toss_1 = rand(10)

toss_2 = rand(2)

result = if toss_1 == 0
           "Ребро."
         elsif toss_2 == 0
           "Выпала решка."
         else
           "Выпал орел."
         end

puts result
