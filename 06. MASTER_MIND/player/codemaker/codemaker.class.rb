require_relative '../player.class.rb'

class CodeMaker < Player
  attr_reader :code

  def initialize
    @code = create_code
  end

  protected
  def create_code
    raise "Method not implemented!"
  end

end
