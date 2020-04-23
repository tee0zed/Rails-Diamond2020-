# encoding: utf-8

class Film < Product
  def initialize(price, quantity, author)
    super(price, quantity)
    @director = director
  end
end
