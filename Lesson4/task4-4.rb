# encoding: utf-8

toss = rand(11)

result =
if toss == 0
	"Ребро."
elsif toss.odd?
  "Выпала решка."
else
  "Выпал орел."
end

puts result
