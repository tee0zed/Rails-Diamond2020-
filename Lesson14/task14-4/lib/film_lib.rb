 # encoding: utf-8

class FilmLib
  attr_reader :films, :directors
  def initialize(path)
    @films = get_films(path)
    @directors = get_directors
  end

  private

  def get_directors
    directors = Array.new

    @films.each do |film|
      directors << film.director unless directors.include?(film.director)
    end
    directors
  end

  def get_films(path)
    films = Dir.glob(path)
    films.map { |film| Film.new(*File.readlines(film, chomp: true))}
  end
end
