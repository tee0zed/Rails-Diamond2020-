# encoding: utf-8

class Film
  attr_reader :title, :director, :year

  def initialize(title, year, director)
    @title = title
    @year = year
    @director = director
  end

  def to_string
    "Фильм: #{title}, Режиссер: #{director}, Год: #{year}"
  end
end
