# encoding: utf-8

require_relative 'lib/quiz'

def give_me_input(num, kot, kota, kotov)
  digit = num % 10

  if num.digits[1] == 1
    kotov
  elsif digit == 1
    kot
  elsif digit.between?(2, 4)
    kota
  else
    kotov
  end
end

questions = Quiz.get_questions

array = questions.sample(5)

score = 0

array.each do |single|
  puts
  puts single.question
  puts "#{single.score} #{give_me_input(score, "балл", "балла", "баллов")}"

  input = STDIN.gets.downcase.chomp

  if input == single.answer
    puts "Правильно!"
    score += single.score
    puts "У вас #{score} #{give_me_input(score, "балл", "балла", "баллов")}"
  else
    puts "Неправильно: #{single.answer}"
  end

  sleep 1
  puts "#{single.explanation}"
end

puts "\nВы набрали #{score} #{give_me_input(score, "балл", "балла", "баллов")} из #{array.inject(0){|sum, question| sum += question.score}} возможных."
