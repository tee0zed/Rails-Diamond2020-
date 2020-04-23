# encoding: utf-8

require_relative 'lib/film'
require_relative 'lib/film_lib'

def get_input(array)
  input = 0
  until input.between?(1, array.size)
    puts "Введите одну из предложенных цифр"
    input = STDIN.gets.to_i
  end
  input
end

library = FilmLib.films_from_site(20)

puts
puts "Выберите цифрой режиссера чей фильм вы хотели бы посмотреть."
puts

library.directors.each_with_index do |director, index|
  puts "#{index + 1} #{director}"
end

abort "Произошла ошибка чтения" if FilmLib.films.empty?

puts
input = get_input(library.directors)

film = library.get_random_film(input)

puts film.to_string
