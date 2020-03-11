# encoding: utf-8

require_relative './lib/film'
require_relative './lib/film_lib'

def get_input(array)
  input = 0
  until input.between?(1, array.size)
    puts "Введите одну из предложанных цифр"
    input = STDIN.gets.to_i
  end
  input
end

path = './data/*'

library = FilmLib.new(path)

puts
puts "Выберите цифрой режиссера чей фильм вы хотели бы посмотреть."
puts

library.directors.each_with_index do |director, index|
  puts "#{index+1} #{director}"
end

puts
input = get_input(library.directors)

film = library.get_random_film(input)

film.to_string
