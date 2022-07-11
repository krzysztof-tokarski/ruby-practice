require 'colorize'
require_relative '../code/code.class.rb'
require_relative '../player/computer-player.class.rb'
require_relative '../code/color.module.rb'

class Game
	include Color
	attr_reader :code, :code_maker

	def initialize
		prepare_new_game
	end

	def render_player_guess(player_guess)
		player_guess.each do |color|
			print " #{color[:name]} ".colorize( :background => color[:code])
		end
	end

	private
	def prepare_new_game
		player_choice = take_players_initial_input
  end

	def take_players_initial_input
		puts 'Welcome to Mastermind!'
		puts 'Press [B] to become a CodeBreaker, press [M] to become a CodeMaker!'

		player_choice = nil
		until ['M', 'B'].include? player_choice
			unless player_choice.nil?
				puts 'Incorrect input!'
			end
			player_choice = gets.chomp.upcase
		end
		player_choice
	end

	def process_players_initial_input(input)
		if player_choice == 'B'
			puts "You're going to try breaking the code prepared by your computer!"
			@code_maker = ComputerCodeMaker.new
			@code = @code_maker.code
		else
			puts "You're about to challenge your computer to break your code!"
			# TODO
		end
	end
end

x = Game.new

COLORIZE_CONSTANTS = [
	BLUE = {code: :blue, name: 'Blue'},
	CYAN = {code: :cyan, name: 'Cyan'},
	GREEN = {code: :green, name: 'Green'},
	MAGENTA = {code: :magenta, name: 'Magenta'},
	RED = {code: :red, name: 'Red'},
	WHITE = {code: :white, name: 'White'},
	YELLOW = {code: :yellow, name: 'Yellow'},
]

x.render_player_guess(COLORIZE_CONSTANTS)
