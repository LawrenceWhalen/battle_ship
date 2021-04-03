require './lib/ship'
require './lib/board'
require './lib/cell'

class Game

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    user_input = input

    until (user_input == 'p' || user_input == 'q') do
        puts "Enter p to play. Enter q to quit."
        user_input = input
    end
    if user_input == 'p'
      game_setup
    elsif user_input == 'q'
      exit!
    end
  end

  def game_setup
    computer_submarine = Ship.new('Submarine', 2)
    computer_cruiser = Ship.new('Cruiser', 3)
    computer_board = Board.new

    player_submarine = Ship.new('Submarine', 2)
    player_cruiser = Ship.new('Cruiser', 3)
    player_board = Board.new

    computer_ship_placement(player_cruiser)
    puts player_board.render
  end

  def input
    gets.chomp
  end

  def computer_ship_placement(ship)
     ships_arrays = []
     final_array = []
     die_roll = 1
     if die_roll = 1
      (65..68).each_cons(ship.length) {|array| ships_arrays.push(array)}
      collum = rand(1..4)
      row = ships_arrays.sample
      final_array = row.map do |char|
        char.chr + collum.to_s
      end
    end
    puts final_array
  end
end
