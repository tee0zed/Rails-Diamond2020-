# encoding: utf-8

class Patient
  attr_accessor :adress
  def initialize(f_name, name, p_name, number, adress)
    @f_name = f_name
    @name = name
    @p_name = p_name
    @number = number
    @adress = adress
  end
end

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

adress = Adress.new("23SSA3677", "Obninsk","Aksenova","18","67")

taras = Patient.new("Жук", "Тарас", "Юрьевич", "23SSA3677", adress)

puts taras.adress.to_str
