# encoding: utf-8

def var
  c = "i'm a var!"

  pp defined?($a)
  pp defined?(b)
  pp defined?(c)
end

$a = 42

b = "apple"


pp defined?($a)
pp defined?(b)
pp defined?(c)

puts "---------"

var
