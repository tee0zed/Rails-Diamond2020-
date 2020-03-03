# encoding: utf-8

def string_shuffle(s)
 s.downcase.split('').shuffle.join.capitalize
end

puts string_shuffle(STDIN.gets.strip)
