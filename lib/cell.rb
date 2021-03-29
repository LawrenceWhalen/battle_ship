class Cell
  attr_reader :coordinate,
              :ship,
              :fired_on


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_on = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_on
  end

  def fire_upon
    @fired_on  = true
    if @ship != nil
      @ship.hit 
    end
  end
end
