class Board
  attr_reader :cells

  def initialize
    @cells = Hash.new
  end
end
