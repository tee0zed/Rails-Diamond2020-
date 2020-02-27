# encoding: utf-8

arry = (1..10).to_a

enum = arry.each

size = arry.size

loop do
  arry.unshift(enum.next)
  enum.next
end

arry.pop(size)

puts arry
