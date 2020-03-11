# encoding: utf-8

class Adress
  def initialize(number, city, street, house, appartment)
    @number = number
    @city = city
    @street = street
    @house = house
    @appartment = appartment
  end

  def to_str
    "#{@city}, #{@street} #{@house}, #{@appartment}"
  end
end

taras = Adress.new("23SSA3677", "Obninsk","Aksenova","18","67")

puts taras.to_str
