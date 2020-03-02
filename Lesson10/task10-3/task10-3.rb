# encoding: utf-8
Dir.chdir('./data')
files = Dir.glob('*')

puts "Какой файл показать?"

n = 1

files.each do |file|
  puts "#{n} #{file}"
  n += 1
end

input = gets.to_i

until input.between?(1, files.size)
  puts "Введите номер"
  input = gets.to_i
end

content = File.open(files[input-1], 'r') {|f| f.read}

puts
puts "Содержимое файла #{files[input-1]}:"
puts content
