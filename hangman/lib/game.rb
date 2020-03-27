class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  def errors
    return @user_guesses - @letters
  end

  def errors_made
    return errors.length
  end

  def errors_allowed
    return TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(letter)
          letter
        else
          nil
        end
      end

    return result
  end

  def lost?
    return errors_allowed == 0
  end

  def over?
    return won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
      get_letters(letter)
    end
  end

  def won?
    return (@letters - @user_guesses).empty?
  end

  def word
    return @letters.join
  end

  private

  def get_letters(letter)
    if letter == "Е"
      @user_guesses << "Ё" if  @letters.include?("Ё")
    elsif letter == "И"
      @user_guesses << "Й" if @letters.include?("Й")
    end
      @user_guesses << letter
  end
end