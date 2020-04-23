 # encoding: utf-8

class FilmLib
  attr_reader :films, :directors
  def initialize(path)
    @films = []
    @directors = []

    get_films(path)
    get_directors
  end

  def get_random_film(input)
    index = input - 1

    director = @directors[index]

    films_to_choose = Array.new

    @films.each { |f| films_to_choose << f if f.director == director }

    films_to_choose.sample
  end

  private

  def get_directors
    @films.each do |film|
      @directors << film.director unless @directors.include?(film.director)
    end
  end

  def get_films(path)
    films = Dir.glob(path)

    films.each do |film|
      @films << Film.new(*File.readlines(film, chomp: true))
    end
  end
end
