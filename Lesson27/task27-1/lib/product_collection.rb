# encoding: utf-8
require 'byebug'

class ProductCollection
  attr_accessor :all_products
  # Словарь для связи классов и имен директорий.
  PRODUCT_TYPES = {Book => 'books', Film => 'films'}

  def initialize
    @all_products = []
  end

  def self.from_dir(object)
    # Проходим нещадно аки сатанинский комбайн по каждому продукту... ??? PROFIT!
    PRODUCT_TYPES.each_pair do |klass, dir|
      paths = Dir[__dir__ + '/data/' + dir + "/*"]
      paths.each do |path|
        object.all_products << klass.from_file(path)
      end
    end
  end

  def to_a
    @all_products
  end

  def sort
    @all_products.sort_by { |product| }
  end
end

