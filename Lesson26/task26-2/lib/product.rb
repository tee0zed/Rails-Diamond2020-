# encoding: utf-8

class Product
  attr_reader :price, :quantity

  def initialize(price, quantity)
    @price, @quantity = price, quantity
  end
end
