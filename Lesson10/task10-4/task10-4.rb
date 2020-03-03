# encoding: utf-8

files = Dir.glob('./data/*')

score = 0

questions = Array.new

files.each { |file| questions << File.readlines(file, chomp: true)}

questions.each do |q|
  puts "\n#{q[0]}"

  input = STDIN.gets.chomp

  if input == q[1]
    puts "Правильно!"
    score += 1
  else
    puts "Неправильно: #{q[1]}"
  end

  puts "#{q[2]}"
end

puts "\nВы набрали #{score} очков из #{files.size} возможных."

