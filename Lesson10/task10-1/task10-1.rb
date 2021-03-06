# encoding: utf-8

file_path = ARGV[0]

lines = []

if file_path.nil?
  puts "Введите путь к файлу:"
  file_path = gets.strip
end

begin
  file = File.open(file_path, 'r')
rescue Errno::ENOENT
  puts "Такого файла не существует."
  exit
end

lines = file.readlines

file.close

puts "Файл #{file_path}
строк: #{lines.count}
последние 5 строк:"

lines.last(5).each {|line| puts line}
