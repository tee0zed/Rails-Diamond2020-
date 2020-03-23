# encoding: utf-8

require_relative 'lib/film'
require_relative 'lib/film_lib'

path = __dir__ + '/data/*'

library = FilmLib.new(path)

questions = library.films.sample(3)

puts "Сможете ли вы угадать режиссеров этих фильмов?"

score = 0

questions.each do |film|
  puts
  puts "Фильм: #{film.title}"
  puts "Выберите режиссера."

  answers = []
<<<<<<< Updated upstream
  answers << q.director

  library.directors.delete(q.director)

  answers << library.directors.sample(3)

  answers.shuffle!.flatten!
=======
  answers << film.director

  directors = library.directors

  directors.delete(film.director)

  answers += directors.sample(3)

  answers.shuffle!
>>>>>>> Stashed changes

  puts
  answers.each_with_index do |a, i|
    puts "#{i+1} #{a}"
  end

  input = 0

  while input == 0
    puts "Введите цифру с 1 по 4."
    input = gets.to_i
  end

  if answers[input-1] == film.director
    puts
    puts "Правильно!"
    score += 1
  else
    puts
    puts "Неправильно! #{film.director}"
  end
end

puts "У вас #{score} из 3 очков."

