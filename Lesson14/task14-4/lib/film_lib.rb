 # encoding: utf-8

class FilmLib
  attr_reader :films
  def initialize(path)
    @films = films_from_file(path)
  end

  def directors
    @films.map { |film| film.director }.uniq
  end

  private

  def films_from_file(path)
    films = Dir.glob(path)
    films.map { |film| Film.new(*File.readlines(film, chomp: true))}
  end
end
