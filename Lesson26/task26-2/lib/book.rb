# encoding: utf-8

class Book < Product
  def initialize(price, quantity, author)
    super(price, quantity)
    @author = author
  end
end
