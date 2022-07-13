require_relative './codebreaker.class.rb'

class HumanCodeBreaker < CodeBreaker

  def guess_code(code_length = 4)
    puts 'Make your guess!'
    puts "To take a guess enter #{code_length} colors separated by commas like so"
    puts 'Black, Blue, Green, Yellow'
    puts 'Possible colors:'
    render_array_of_colors(COLORIZE_CONSTANTS)
    # TODO refactor

    guess_is_valid = false
    until guess_is_valid
        players_guess = gets.chomp.split(',').map(&:strip).map(&:capitalize)
        guess_is_valid = is_guess_valid?(players_guess)

        unless guess_is_valid
          puts 'Incorrect input!'
        end
    end
    players_guess
  end

  def is_guess_valid?(players_guess)
    color_names = get_array_of_raw_color_names(COLORIZE_CONSTANTS)
    # TODO refactor
    players_guess.any? && players_guess.all? { |color| color_names.include?(color) }
  end

  # def map_color_names_to_colors(players_guess)
  #   players_guess.map do |color|
  #     COLORIZE_CONSTANTS
  # end
  # TODO

end

x = HumanCodeBreaker.new
x.guess_code
