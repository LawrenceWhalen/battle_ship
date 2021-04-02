class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    @health < 1
  end

  def hit
    if @health > 0
      @health -= 1
    else
      "edge protection"
    end
  end
end
