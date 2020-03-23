# encoding: utf-8

class MyClass
  def initialize
    @variable = 2
  end

  def check_variables
    puts "В классе:"
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная '@variable': #{defined?(@variable)}"
  end
end

class Class2
  @variable2 = 3
end

obj = MyClass.new

obj2 = Class2.new

puts @variable
puts @variable233
