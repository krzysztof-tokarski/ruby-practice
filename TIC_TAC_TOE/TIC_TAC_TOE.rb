require_relative './game/game.rb'

class TicTacToe
  @@game = Game.new

  def self.launch_tic_tac_toe
    @@game.gameplay_loop
  end

end

TicTacToe.launch_tic_tac_toe
