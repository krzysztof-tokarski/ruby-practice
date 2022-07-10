require_relative '../player/player.rb'
require_relative '../board/board.rb'

class Game
  attr_reader :player1, :player2, :board, :current_player, :game_won, :game_tied

  def initialize
    new_game = prepare_new_game
    @player1 = new_game[:player1]
    @player2 = new_game[:player2]
    @board = new_game[:board]
    @game_won = false
    @game_tied = false

    set_current_player

    render_board
  end

  def gameplay_loop
    until @game_won || @game_tied
      input = take_input
      process_input(input)
    end
    finish_game
  end

  private
  def take_input
    target_cell_is_available = false

    until target_cell_is_available
      row_input = nil
      until [1, 2, 3].include? row_input
        unless row_input.nil?
          puts 'Incorrect input!'
        end
        print "#{@current_player.name}, please specify the row where you'd like to place your marker - enter [1] to select the top one, [2] to select the middle one, [3] to select the bottom one: "
        row_input = gets.chomp.to_i
      end

      row_index_input = nil
      until [1, 2, 3].include? row_index_input do
        unless row_index_input.nil?
          puts 'Incorrect input!'
        end
        print "#{@current_player.name}, please specify a position inside the row where you'd like to place your marker - enter [1] to select the left one, [2] to select the middle one, [3] to select the right one: "
        row_index_input = gets.chomp.to_i
        end

      target_cell_is_available = @board.check_if_cell_is_free(row_input - 1, row_index_input - 1)
      unless target_cell_is_available
        puts "This cell is already taken!"
      end
    end
    return {row_input: row_input, row_index_input: row_index_input}
  end

  def process_input(input)
    @board.set_cells_state(@current_player.marker, input[:row_input] - 1, input[:row_index_input] - 1)
    render_board
    set_current_player
    @game_won = @board.check_if_win
    @game_tied = @board.check_if_any_cell_is_free
    @game_tied
  end

  def prepare_new_game
    print "Player 1's name is: "
    player1_name = gets.chomp

    print "Player 2's name is: "
    player2_name = gets.chomp

    player1 = Player.new(player1_name)
    player1.marker = 'O'
    player2 = Player.new(player2_name)
    player2.marker = 'X'
    board = Board.new

    puts "Player 1 (#{player1.name}) will start and play as \"#{player1.marker}\", Player 2 (#{player2.name}) will go second and play as \"#{player2.marker}\""

    {player1: player1, player2: player2, board: board}
  end

  def set_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def render_board
    board.render_board
  end

  def finish_game
    if game_won
      return puts "#{current_player.name} wins!"
    elsif game_tied
      puts "It's a draw!"
    end
  end

end
