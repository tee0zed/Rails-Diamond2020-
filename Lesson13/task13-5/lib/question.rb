# encoding: utf-8

class Question
  attr_reader :question, :answer, :explanation, :score
  def initialize(question, answer, explanation, score)
    @question = question
    @answer = answer
    @explanation = explanation
    @score = score.to_i
  end

  def self.get_questions
    files = Dir.glob('./data/*')

    questions = Array.new

    files.each_with_index do |file|
      params = File.readlines(file, chomp: true)
      questions << Question.new(*params)
    end
    questions
  end
end

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
