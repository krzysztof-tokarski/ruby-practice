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
		render_array_of_colors(player_guess)
		@code_broken = does_guess_break_the_code?(player_guess)

		if @code_broken
			puts 'The code was broken, the CodeBreaker wins!'
		elsif @round_counter == 12
			puts 'The code remains unbroken, the CodeMaker wins!'
		else
			@round_counter += 1
			puts 'The CodeMaker didn\'t manage to break the code yet, we shall continue to the next round!'
			review = compare_failed_guess_against_code(player_guess)
			indication_of_hits_and_misses_count = convert_reviewed_failed_guess_to_colors(review)
			render_array_of_colors(indication_of_hits_and_misses_count)
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
			@code = get_array_of_raw_color_names(@code_maker.code)
		else
			puts "You're about to challenge your computer to break your code!"
			# TODO
		end
	end

	def does_guess_break_the_code?(player_guess)
		@code == player_guess
	end

	def compare_failed_guess_against_code(player_guess)
		review = {
			perfect_matches: 0,
			color_matches_only: 0,
		}

		player_guess.each_with_index do |color, index|
			is_perfect_match = player_guess[index] == @code[index]
			if is_perfect_match
				return review[:perfect_matches] += 1
			else
				is_color_match = @code.include? color
				if is_color_match
					return review[:color_matches_only] += 1
		end

		return review
	end

	def convert_reviewed_failed_guess_to_colors(review)
		color_matches_indicators = []

		color_matches_indicators.concat(Array.new(review[:perfect_matches], COLORIZE_CONSTANTS.RED))
		color_matches_indicators.concat(Array.new(review[:color_matches_only], COLORIZE_CONSTANTS.WHITE))

		complete_misses_count = @code.length - (review[:perfect_matches] + review[:color_matches_only])
		color_matches_indicators.concat(Array.new(complete_misses_count, COLORIZE_CONSTANTS.GRAY))

		return color_matches_indicators
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
