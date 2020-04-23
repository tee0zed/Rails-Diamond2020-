# encoding: utf-8

class ProductCollection
  attr_reader :products
  # Словарь для связи классов, массивов для инициализации экземпляра и имен директорий.
  PRODUCT_TYPES =
    [
    {klass: Book, dir: 'books'},
    {klass: Film, dir: 'films'},
    {klass: Disk, dir: 'disks'}
    ]

  def self.from_dir(path)
    products = []
    PRODUCT_TYPES.each do |hash|
      # массив имен путей
      paths = Dir[File.join(path + hash[:dir] + "/*.txt")]
      # получить объекты класса, соответствующего имени директории в словаре PRODUCT_TYPES
      paths.each do |path|
        products << hash[:klass].from_file(path)
      end
    end
    # создать экземпляр класса ProductCollection из массива всех полученных объектов
    self.new(PRODUCT_TYPES[Book][1], PRODUCT_TYPES[Film][1], PRODUCT_TYPES[Disk][1])
  end

  def initialize(products = [])
    @products = products
  end

  def product_types
    @products.map(&:type).uniq
  end

  def products_by_type(type)
    @products.select{|product| product.type == type}
  end

  def to_s
    product_types.map do |type|
      products_by_type(type)
    end
    .flatten
    .map.with_index(1) do |product, index|
      "#{index}. #{product}"
    end.join("\n")
  end

  def to_a
    @products
  end

  def sort!(by:, order: :asc)
    case :by
    when :title
      @products.sort_by!(&:title)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:price)
    end

    @products.reverse! if order == :desc

    self
  end
end
