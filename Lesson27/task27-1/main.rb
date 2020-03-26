# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

path = __dir__ + '/data/'

collection = ProductCollection.from_dir(path)

collection.sort!(by: :price, group?: true)

puts collection.to_str
