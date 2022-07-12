require 'colorize'
require_relative '../code/code.class.rb'
require_relative '../player/computer-player.class.rb'
require_relative '../color.module.rb'

class Game
	include Color
	attr_reader :code, :code_maker, :round_counter, :code_broken

	def initialize
		prepare_new_game
		@round_counter = 1
		@code_broken = false
	end

	def process_guess(player_guess)
		render_player_guess(player_guess)
		@code_broken = does_guess_break_the_code?(player_guess)

		if @code_broken
			puts 'The code was broken, the CodeBreaker wins!'
		elsif @round_counter == 12
			puts 'The code remains unbroken, the CodeMaker wins!'
		else
			@round_counter += 1
			puts 'The CodeMaker didn\'t manage to break the code yet, we shall continue to the next round!'
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

	def render_player_guess(player_guess)
		render_array_of_colors(player_guess)
	end

	def does_guess_break_the_code?(player_guess)
		@code == player_guess
	end
end

# x = Game.new

# COLORIZE_CONSTANTS = [
# 	BLUE = {code: :blue, name: 'Blue'},
# 	CYAN = {code: :cyan, name: 'Cyan'},
# 	GREEN = {code: :green, name: 'Green'},
# 	MAGENTA = {code: :magenta, name: 'Magenta'},
# 	RED = {code: :red, name: 'Red'},
# 	WHITE = {code: :white, name: 'White'},
# 	YELLOW = {code: :yellow, name: 'Yellow'},
# ]

# x.render_player_guess(COLORIZE_CONSTANTS)
