# encoding: utf-8

class Quiz
  def initialize(library = [])
    @questions = library.shuffle!
    @score = 0
  end

  def do_quiz
    @questions.each do |question|
      puts
      ask_question(question)
    end
    puts show_score
    sleep 2
  end

  private

  def ask_question(question)
    puts question.body

    if answer_correct?(STDIN.gets.chomp, question)
      puts "Правильно!"
      puts question.comment
      @score += 1
    else
      puts "Неправильно!"
      puts question.answer
    end
  end

  def answer_correct?(input, question)
    input == question.answer
  end

  def show_score
    "Вы набрали #{@score} очков."
  end
end
