# encoding: utf-8

class CurrencyDiplomat
  attr_reader :amount, :rate, :name

  def initialize(amount, rate, name)
    @amount = amount
    @rate = rate
    @name = name
  end
end
