require 'colorize'

module Color

  COLORIZE_CONSTANTS = [
    BLUE = {code: :blue, name: 'Blue'},
    CYAN = {code: :cyan, name: 'Cyan'},
    GREEN = {code: :green, name: 'Green'},
    MAGENTA = {code: :magenta, name: 'Magenta'},
    RED = {code: :red, name: 'Red'},
    WHITE = {code: :white, name: 'White'},
    YELLOW = {code: :yellow, name: 'Yellow'},
  ].freeze

  def render_array_of_colors(colors_array)
		colors_array.each do |color|
			print " #{color[:name]} ".colorize( :background => color[:code])
		end
    puts
	end
end

# p Color::COLORIZE_CONSTANTS

# puts "This is blue".colorize(:blue)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "This is light blue with red background".colorize(:color => :black, :background => x)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red
