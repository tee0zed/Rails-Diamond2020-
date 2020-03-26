# encoding: utf-8

class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def to_str
    "#{@price} руб. (осталось #{@amount})"
  end

  def self.from_file(path)
    raise NotImplementedError
  end
end
