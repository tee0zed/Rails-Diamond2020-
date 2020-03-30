# encoding: utf-8

class Disk < Product
  attr_accessor :title, :year, :genre, :artist

  def self.from_file(path)
    params = File.readlines(path, chomp: true)

    self.new(
      title: params[0],
      artist: params[1],
      genre: params[2],
      year: params[3].to_i,
      price: params[4].to_i,
      amount: params[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def to_s
    "Альбом: #{@title}, #{@artist} жанр: #{genre}, #{year}. #{super}"
  end
end
