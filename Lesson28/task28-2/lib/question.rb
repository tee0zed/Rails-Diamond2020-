# encoding: utf-8

class Question
  attr_reader :body, :answer, :comment
  def initialize(question, answer, comment)
    @body = question
    @answer = answer
    @comment = comment
  end
end
