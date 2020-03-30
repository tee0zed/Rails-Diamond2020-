# encoding: utf-8

class Product
  attr_accessor :price, :amount

  def self.from_file(path)
    raise NotImplementedError
  end

  def buy
    if self.amount > 0
      self.amount -= 1
      return self.price
    else
      nil
    end
  end

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def type
    self.class.name.downcase
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end
end
