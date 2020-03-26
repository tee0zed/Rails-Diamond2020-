# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

collection = ProductCollection.new

ProductCollection.from_dir(collection)

p collection.to_a
