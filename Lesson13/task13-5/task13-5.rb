# encoding: utf-8

require_relative './lib/question'

questions = Question.get_questions

questions.shuffle!

score = 0

questions.each do |question|
  puts
  puts question.question
  puts "#{question.score} #{give_me_input(question.score, "балл", "балла", "баллов")}"

  input = STDIN.gets.downcase.chomp

  if input == question.answer
    puts "Правильно!"
    score += question.score
    puts "У вас #{score} #{give_me_input(score, "балл", "балла", "баллов")}"
  else
    puts "Неправильно: #{question.answer}"
  end

  sleep 1
  puts "#{question.explanation}"
end

puts "\nВы набрали #{score} #{give_me_input(score, "балл", "балла", "баллов")} из #{questions.inject(0){|sum, question| sum += question.score}} возможных."
