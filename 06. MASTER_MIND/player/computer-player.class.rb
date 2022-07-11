require './player.class.rb'

class ComputerPlayer < Player
end

class ComputerCodeMaker < ComputerPlayer
  attr_reader :code

  def initialize
    @code = generateRandomCode
  end

  def generateRandomCode(code_length = 4)
    COLORIZE_CONSTANTS.sample(4)
  end
end
