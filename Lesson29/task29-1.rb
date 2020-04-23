# encoding: utf-8

require 'rexml/document'
require 'date'
require 'byebug'

file_path = __dir__ + '/data/wishes.xml'

unless File.exists?(file_path)
  File.open(file_path, 'w') do |file|
    file.puts "<?xml version='1.0' encoding='UTF-8'?>"
    file.puts '<wishes></wishes>'
  end
end

xml_file = File.new(file_path, 'w+')
doc = REXML::Document.new(xml_file)

puts 'В этом сундуке хранятся ваши желания.'
puts
puts 'Чего бы вы хотели?'
wish_text = STDIN.gets.chomp

puts
puts 'До какого числа вы хотите осуществить это желание?'
puts 'Укажите дату в формате ДД.ММ.ГГГГ'

byebug
begin
  wish_date_input = STDIN.gets.chomp

  wish_date = Date.parse(wish_date_input)
rescue Date::Error
  puts "Неверный формат даты!"
  retry
end
wish = doc.root.add_element('wish', {'date' => wish_date.strftime('%d.%m.%Y')})

wish.add_text(wish_text)

xml_file.write(file)
xml_file.close
