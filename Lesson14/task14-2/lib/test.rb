# encoding: utf-8

class Test
  def initialize(name)
    @name = name
    @score = 0
    @questions = File.readlines ('./data/questions.txt')
    @results = File.read('./data/results.txt').split("\n\n")
  end

  def test_start
    @questions.each do |q|
      puts
      puts q
      puts "\n0) нет
      \n1) иногда
      \n2) да"

      @score += get_input
    end
  end

  def get_result
    result = if @score >= 30
               @results[0]
             elsif @score.between?(25, 29)
               @results[1]
             elsif @score.between?(19, 24)
               @results[2]
             elsif @score.between?(14, 18)
               @results[3]
             elsif @score.between?(9, 13)
               @results[4]
             elsif @score.between?(4, 8)
               @results[5]
             elsif @score.between?(0, 3)
               @results[6]
             end
    result
  end

  private

  def get_input(input = nil)
    until input =~ /^[0-2]{1}$/
      puts 'Выберите цифру.'
      input = STDIN.gets.strip
    end
    input.to_i
  end
end
