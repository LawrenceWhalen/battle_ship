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
    # Checks if @ship is nil
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

  # render marks a cell with a string based on the situation
  def render(optional = false)
    # returns . string if it wasnt shot at and with a default optional
    if @fired_on == false && optional == false
      '.'
    # returns M string if shot was fired & cell is empty
    elsif @fired_on == true && @ship == nil
      'M'
    # returns . string if it wasnt shot at & true is passed to optional & cell is empty
    elsif @fired_on == false && @ship == nil && optional == true
      '.'
    # returns S string if shot wasn't fired_on & cell is empty & true is passed to optional
    elsif @fired_on == false && @ship != nil && optional == true
      'S'
    # returns H string if fired_on is true & cell is not empty & and ship in the cell has not sunk
    elsif @fired_on == true && @ship != nil && @ship.sunk? == false
      'H'
    # returns X string if cell is fired at & cell is not empty & and the ship in the cell has sunk
    elsif @fired_on == true && @ship != nil && @ship.sunk? == true
      'X'
    end
  end
end
