# encoding: utf-8

class ProductCollection
  attr_accessor :all_products
  # Словарь для связи классов и имен директорий.
  PRODUCT_TYPES = {Book => 'books', Film => 'films', Disk => 'disks'}

  def initialize(products = [])
    @all_products = products
  end

  def self.from_dir(path)
    products = []

    PRODUCT_TYPES.each_pair do |klass, dir|
      # массив имен путей
      paths = Dir[path + dir + "/*"]
      # получить объекты класса, соответствующего имени директории в словаре PRODUCT_TYPES
      paths.each do |path|
        products << klass.from_file(path)
      end
    end
    # создать экземпляр класса ProductCollection из массива всех полученных объектов
    self.new(products)
  end

  def to_str
    lines = []

    @all_products.each_with_index do |obj, indx|
      lines << "#{indx + 1} #{obj.to_str}"
    end
    lines
  end

  def to_a
    @all_products
  end

  def sort!(products, params)
    # если не передано ни одного аргумента:
    params ||= {by: :type}

    if params[:group?]
      disks.sort!(params)
    else
      products = @all_products
    end

    case params[:by]
    when :type
      products.sort_by! {|product| product.class.to_s}
    when :title
      products.sort_by! {|product| product.title}
    when :amount
      products.sort_by! {|product| product.amount}
    when :price
      products.sort_by! {|product| product.price}
    end
    products.reverse! if params[:ord] == :asc
    self
  end

  private

  def by_type
    "Диски:
    #{disks.sort!(params)}

    Книги:
    #{books.sort!(params)}

    Фильмы:
    #{films.sort!(params)}"
  end

  # массивы по типам объектов
  def disks
    @all_products.select { |product| product.is_a? Disk }
  end

  def books
    @all_products.select { |product| product.is_a? Book }
  end

  def films
    @all_products.select { |product| product.is_a? Film }
  end
end
