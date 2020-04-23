# encoding: utf-8

require './lib/film'
require './lib/film_lib'

def get_input(array)
  input = 0
  until input.between?(1, array.size)
    puts "Введите одну из предложанных цифр"
    input = STDIN.gets.to_i
  end
  input
end

path = __dir__ + '/spec/fixtures/*'

library = FilmLib.new(path)

puts library.films.first

# puts
# puts "Выберите цифрой режиссера чей фильм вы хотели бы посмотреть."
# puts

# library.directors.each_with_index do |director, index|
#   puts "#{index+1} #{director}"
# end

# puts
# input = get_input(library.directors)

# film = library.get_random_film(input)

# puts film.to_string
