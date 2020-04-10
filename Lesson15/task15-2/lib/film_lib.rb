 # encoding: utf-8

require_relative 'kinopoisk_scrapper'

class FilmLib
  extend KinopoiskScrapper

  attr_accessor :films, :directors

  def self.from_dir(path)
    films =
    Dir.glob(path).map do |film|
      Film.new(*File.readlines(film, chomp: true))
    end
    new(films)
  end

  def initialize(films)
    @films = films
    @directors = get_directors
  end

  def get_random_film(index)
    director = directors[index - 1]
    films_to_choose = films

    films_to_choose.select! { |f| f.director == director }
    films_to_choose.sample
  end

  private

  def get_directors
    films.map { |film| film.director }.uniq
  end
end
