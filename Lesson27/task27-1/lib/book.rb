# encoding: utf-8

class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(path)
    params = File.readlines(path, chomp: true)

    self.new(
      title: params[0],
      genre: params[1],
      author: params[2],
      price: params[3].to_i,
      amount: params[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def to_s
    "Книга: #{@title} автор: #{@author} #{genre}, #{super}"
  end
end
