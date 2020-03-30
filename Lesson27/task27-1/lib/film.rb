# encoding: utf-8

class Film < Product
  attr_accessor :title, :year, :director

  def self.from_file(path)
    params = File.readlines(path, chomp: true)

    self.new(
      title: params[0],
      director: params[1],
      year: params[2].to_i,
      price: params[3].to_i,
      amount: params[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def to_s
    "Фильм: #{@title} #{@year} режиссер: #{director}, #{super}"
  end
end
