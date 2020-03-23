# encoding: utf-8

class Quiz
  attr_reader :question, :answer, :explanation, :score
  def initialize(question, answer, explanation, score)
    @question = question
    @answer = answer
    @explanation = explanation
    @score = score.to_i
  end

  def self.get_questions
    files = Dir.glob('./data/*')

    questions = []

    files.each_with_index do |file|
      params = File.readlines(file, chomp: true)
      questions << Quiz.new(*params)
    end
    questions
  end
end
