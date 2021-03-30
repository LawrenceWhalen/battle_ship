class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  # returns boolean based on @health
  def sunk?
    # @health is not 0 returns false
    @health < 1
  end

  # lowers battleships health
  def hit
    if @health > 0
      # @health of ship is lowered by one
      @health -= 1
    else
      "edge protection"
    end
  end
end
