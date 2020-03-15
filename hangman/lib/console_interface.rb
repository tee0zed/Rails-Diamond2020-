class ConsoleInterface
  FIGURES = Dir['./data/figures/*.txt'].sort.map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_made}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_allowed}

    END

    if @game.won?
      puts "Поздравляем, вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  def figure
    return FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

    return result.join(' ')
  end

  def errors_to_show
    return @game.errors.join(', ')
  end

  def get_input
    print "Введите следующую букву: "
    letter = gets[0].upcase

    letter = "Е" if letter == "Ё"
    letter = "И" if letter == "Й"

    return letter
  end
end
