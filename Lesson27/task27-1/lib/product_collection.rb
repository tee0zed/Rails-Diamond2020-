# encoding: utf-8
require 'byebug'

class ProductCollection
  attr_reader :sort_result, :books, :films, :disks
  # Словарь для связи классов, массивов для инициализации экземпляра и имен директорий.
  PRODUCT_TYPES =
    {
    Book => ['books', books = []],
    Film => ['films', films = []],
    Disk => ['disks', disks = []]
    }

  def initialize(books, films, disks)
    @books = books
    @films = films
    @disks = disks
    @sort_result = []
  end

  def self.from_dir(path)
    PRODUCT_TYPES.each_pair do |klass, arr|
      # массив имен путей
      paths = Dir[path + arr[0] + "/*"]
      # получить объекты класса, соответствующего имени директории в словаре PRODUCT_TYPES
      paths.each do |path|
        obj = klass.from_file(path)
        arr[1] << obj
      end
    end
    # создать экземпляр класса ProductCollection из массива всех полученных объектов
    self.new(PRODUCT_TYPES[Book][1], PRODUCT_TYPES[Film][1], PRODUCT_TYPES[Disk][1])
  end

  def to_str
    lines = []
    n = 1

    @sort_result.each do |obj|
      # если не строка, а строки разделяют списки, то объект:
      unless obj.is_a? String
        lines << "#{n} #{obj.to_str}"
        n += 1
      else
      # если строка, то пишем ее как сепаратор.
        lines << "\n" + obj
      end
    end
    lines
  end

  def to_a
    @all_products
  end

  def sort!(params = {})
    # если не задано никаких параметров:
    params[:by] ||= :tit
    params[:group?] ||= false
    # массив для результатов сортировки
    @sort_result = []

    if params[:group?]
    # если сортируем по группам товаров, то передаем в метод sort каждый тип товара.
      [@books, @disks, @films].each do |type|
        sorting(params, type)
      # вставим в массив строку с названием класса
        @sort_result << "#{type.first.class}s"
      # и отсортированный класс в этот же массив
        @sort_result += type
      end
    # если по типу не сортируем, то берем массив всех товаров.
    else
      products = @books + @disks + @films
      @sort_result += sorting(params, products)
    end
    # для вызова по цепочке (пригодится?)
    @sort_result
  end

  def sorting(params, obj)
    case params[:by]
    when :title
      obj.sort_by! {|product| product.title}
    when :price
      obj.sort_by! {|product| product.price}
    when :amount
      obj.sort_by! {|product| product.amount}
    end
    obj.reverse! if params[:asc]
    obj
  end
end
