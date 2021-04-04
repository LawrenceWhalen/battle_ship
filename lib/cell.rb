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

  # Places the passed ship into a empty cell
  def place_ship(ship)
    # Passed ship instance becomes out @ship
    @ship = ship
  end

  # Boolean return for if a cell has been fired upon
  def fired_upon?
    @fired_on
  end

  # Allows us to fire on a cell
  def fire_upon
    # Sets @fired_on to true
    @fired_on  = true
    # Checking if there is a ship
    if @ship != nil
      # Calling the method .hit on @ship instance
      @ship.hit
    end
  end

  def ship_sunk?
    @ship.sunk?
  end

  def render(optional = false)
    if @fired_on == false && optional == false
      "."
    elsif @fired_on == true && @ship == nil
      "M"
    elsif @fired_on == false && @ship == nil && optional == true
      "."
    elsif @fired_on == false && @ship != nil && optional == true
      "S"
    elsif @fired_on == true && @ship != nil && !@ship.sunk?
      "H"
    elsif @fired_on == true && @ship != nil && @ship.sunk?
      "X"
    end
  end
end
