class Player
  attr_reader :name, :marker

  def initialize(name)
    @name = name
  end

  def marker=(marker)
    @marker = marker
  end
end
