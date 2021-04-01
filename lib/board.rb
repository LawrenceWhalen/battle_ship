require 'pry'

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

  def valid_placement?(ship, coordinate_array)
    ship.length == coordinate_array.count
    known_array = Array.new(coordinate_array.count){ |i| i + 1 }
    number_array = []
    letter_array = []
    coordinate_array.each do |coordinate|
      split_coorddinate = coordinate.scan(/./)
      letter_array.push(split_coorddinate[0])
      number_array.push(split_coorddinate[1])
    end
    number_array_alpha = convert_string_array(letter_array)
    number_array_numeric = convert_string_array(number_array)
    offset = number_array_alpha[0] - 1
    offset_array_alpha = number_array_alpha.map do |number|
      number - offset
    end

    binding.pry
    # offest_array_alpha == known_array
  end

  def convert_string_array(passed_array)
    converted_characters = []
    passed_array.each do |character|
      if character == 'A' || character == '1'
        converted_characters.push(1)
      elsif character == 'B' || character =='2'
        converted_characters.push(2)
      elsif character == 'C' || character == '3'
        converted_characters.push(3)
      elsif character == 'D' || character == '4'
        converted_characters.push(4)
      end
    end
    converted_characters
  end
end
