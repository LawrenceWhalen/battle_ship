require "pry"

class Board
  attr_reader :cells

  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4"),
                                    }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinate_test_array)

    string_array_alpha = coordinate_seperator(coordinate_test_array, 0)
    string_array_numeric = coordinate_seperator(coordinate_test_array, 1)
    character_to_integer_array = convert_string_to_integer(string_array_alpha, "character")
    number_to_integer_array = convert_string_to_integer(string_array_numeric, "number")
    
    if character_to_integer_array.uniq.length != 1 && number_to_integer_array.uniq.length != 1
      false
    elsif !consecutive_test_valid?(character_to_integer_array) && !consecutive_test_valid?(number_to_integer_array)
      false
    elsif ship.length != coordinate_test_array.length
      false
    elsif !overlap?(coordinate_test_array)
      false
    else
      true
    end
  end

  def coordinate_seperator(coordinate_combined, index)
    coordinate_seperated = []
    coordinate_combined.map do |coordinate|
      split_coordinate = coordinate.scan(/./)
      coordinate_seperated.push(split_coordinate[index])
    end
    coordinate_seperated
  end

  def convert_string_to_integer(passed_array, type)
    if type == "character"
      passed_array.map do |character|
        character.ord
      end
    elsif  type == "number"
      passed_array.map do |character|
        character.to_i
      end
    end
  end

  def consecutive_test_valid?(string)
    string.each_cons(2).all? do |a|
      a[1] - a[0] == 1
    end
  end

  def overlap?(coordinate_array_overlap)
    coordinate_array_overlap.all? do |coordinate_test_truthy|
      @cells[coordinate_test_truthy].empty?
    end
  end

  def place(ship, place_cells)
    if valid_placement?(ship, place_cells)
      place_cells.map { |coordinate| @cells[coordinate].place_ship(ship) }
    end
  end

  def render(optional = false)
    "  1 2 3 4 \nA #{@cells["A1"].render(optional)} #{@cells["A2"].render(optional)} #{@cells["A3"].render(optional)} #{@cells["A4"].render(optional)} \nB #{@cells["B1"].render(optional)} #{@cells["B2"].render(optional)} #{@cells["B3"].render(optional)} #{@cells["B4"].render(optional)} \nC #{@cells["C1"].render(optional)} #{@cells["C2"].render(optional)} #{@cells["C3"].render(optional)} #{@cells["C4"].render(optional)} \nD #{@cells["D1"].render(optional)} #{@cells["D2"].render(optional)} #{@cells["D3"].render(optional)} #{@cells["D4"].render(optional)} \n"
  end
end
