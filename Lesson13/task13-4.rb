# encoding: utf-8

class Chameleon
  attr_accessor :color
  def initialize(color)
    @color = color
  end
end

joe = Chameleon.new("red")

joe.color = "blue"

puts joe.color
