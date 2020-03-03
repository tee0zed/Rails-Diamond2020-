# encoding: utf-8

def string_shuffle(s)
 s.downcase.split(' ').map {|word| word.split('').shuffle.join}.shuffle.join(' ')
end

puts string_shuffle(STDIN.gets.strip)
