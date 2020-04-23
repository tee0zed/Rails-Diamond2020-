# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

book = Book.new(12, 3, 'хуй с горы')

p Book === book
