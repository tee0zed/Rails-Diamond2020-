# encoding: utf-8

require_relative 'lib/film'
require_relative 'lib/film_lib'

path = './data/*'

library = FilmLib.new(path)

questions = library.films.sample(3)

puts "Сможете ли вы угадать режиссеров этих фильмов?"

score = 0

questions.each do |q|
  puts
  puts "Фильм: #{q.title}"
  puts "Выберите режиссера."

  answers = []
  answers << q.director

  library.directors.delete(q.director)

  answers << library.directors.sample(3)

  answers.shuffle!.flatten!

  puts
  answers.each_with_index do |a, i|
    puts "#{i+1} #{a}"
  end

  input = 0

  while input == 0
    puts "Введите цифру с 1 по 4."
    input = gets.to_i
  end

  if answers[input-1] == q.director
    puts
    puts "Правильно!"
    score += 1
  else
    puts
    puts "Неправильно! #{q.director}"
  end
end

puts "У вас #{score} из 3 очков."

