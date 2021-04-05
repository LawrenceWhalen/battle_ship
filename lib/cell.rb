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

  def ship_sunk?
    @ship.sunk?
  end

  def render(optional = false)
    if @fired_on == false && (optional == false || (@ship == nil && optional == true))
      "."
    elsif @fired_on == true && @ship == nil
      "M"
    elsif @fired_on == false && @ship != nil && optional == true
      "S"
    elsif @fired_on == true && @ship != nil && !@ship.sunk?
      "H"
    elsif @fired_on == true && @ship != nil && @ship.sunk?
      "X"
    end
  end
end
