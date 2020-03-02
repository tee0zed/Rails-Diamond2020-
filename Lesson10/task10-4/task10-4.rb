# encoding: utf-8

files = Dir.glob('./data/*').sort

score = 0

files.each do |file|
  array = File.open(file, 'r') {|f| f.readlines}.map(&:chomp)

  puts "\n#{array[0]}"

  input = STDIN.gets.chomp

  if input == array[1]
    puts "Правильно!"
    score += 1
  else
    puts "Неправильно: #{array[1]}"
  end

  puts "#{array[2]}"

  array.clear
end

puts "\nВы набрали #{score} очков из #{files.size} возможных."

