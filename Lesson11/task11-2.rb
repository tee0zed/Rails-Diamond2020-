# encoding: utf-8

def name_sortener(surname, name, secname)
  name = name[0] + "."
  secname = secname[0] + "."
  surname = surname + " "
  surname + name + secname
end

surname = STDIN.gets.strip

name = STDIN.gets.strip

secname = STDIN.gets.strip

puts name_sortener(surname, name, secname)
