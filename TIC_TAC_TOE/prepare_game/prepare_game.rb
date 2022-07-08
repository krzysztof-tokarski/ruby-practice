require_relative '../player/player.rb'

def prepare_game
  print "Player 1's name is: "
  player1_name = gets.chomp
  player1 = Player.new(player1_name);
  player1.marker = "O"

  print "Player 2's name is: "
  player2_name = gets.chomp
  player2 = Player.new(player2_name);
  player2.marker = "X"
  print "Player 1(#{player1.name}) will start and play as \"#{player1.marker}\", Player 2(#{player2.name}) will go second and play as \"#{player2.marker}\""
end
