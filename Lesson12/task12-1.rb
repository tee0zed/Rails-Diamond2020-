# encoding: utf-8

def vowels_count(string)
  string.scan(/(?i)([a,e,i,o,u,а,у,о,ы,и,э,я,ю,ё,е])/).count
end

input = gets.strip

puts "В этой строке #{vowels_count(input)} гласных.
