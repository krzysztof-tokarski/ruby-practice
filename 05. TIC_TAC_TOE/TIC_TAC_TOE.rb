require_relative './game/game.rb'

class TicTacToe

  @@game = Game.new

  def self.launch_tic_tac_toe
    @@game.gameplay_loop
    play_again
  end

  private
  def self.play_again
    print 'Do you want to play again? [Y/N] '
    input = nil
    until ['Y', 'N'].include? input
      unless input.nil?
        puts 'Incorrect input!'
      end
      input = gets.chomp.upcase
    end

    if input == 'Y'
      @@game = Game.new
      self.launch_tic_tac_toe
    else
      puts 'Goodbye!'
    end
  end
end

TicTacToe.launch_tic_tac_toe
