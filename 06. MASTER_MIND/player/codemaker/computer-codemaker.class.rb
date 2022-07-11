require_relative './codemaker.class.rb'

class ComputerCodeMaker < CodeMaker

  def create_code
    generateRandomCode
  end

  def generateRandomCode(code_length = 4)
    COLORIZE_CONSTANTS.sample(4)
  end
end
