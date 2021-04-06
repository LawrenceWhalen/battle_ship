require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/turn"

class Game
  attr_reader :computer_submarine,
              :computer_cruiser,
              :computer_board,
              :player_submarine,
              :player_cruiser,
              :player_board



    def initialize
      @computer_submarine = Ship.new("Submarine", 2)
      @computer_cruiser = Ship.new("Cruiser", 3)
      @computer_board = Board.new

      @player_submarine = Ship.new("Submarine", 2)
      @player_cruiser = Ship.new("Cruiser", 3)
      @player_board = Board.new
    end


  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    user_input = input

    until (user_input == "p" || user_input == "q")
        puts "Enter p to play. Enter q to quit."
        user_input = input
    end
    if user_input == "p"
      game_setup
    elsif user_input == "q"
      exit!
    end
  end

  def game_setup
    computer_ship_placement
    player_ship_placement
    turn_loop
  end

  def turn_loop
    until player_sunk? || computer_sunk?
      take_turn
    end
    if player_sunk? && computer_sunk?
      puts "It's a tie!"
    elsif computer_sunk?
      puts "You win!!!"
    else
      puts "You lose"
    end
    restart
  end

  def player_sunk?
    ((@player_cruiser.sunk?) && (@player_submarine.sunk?))
  end

  def computer_sunk?
    ((@computer_cruiser.sunk?) && (@computer_submarine.sunk?))
  end

  def take_turn
    turn = Turn.new(@player_board, @computer_board)
    turn_shots_taken = turn.start_turn
    @computer_board.cells[turn_shots_taken[0]].fire_upon
    @player_board.cells[turn_shots_taken[1]].fire_upon
    turn.score_board(turn_shots_taken, @player_board, @computer_board)
  end

  def player_ship_placement
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_cruiser_input = input.split(" ").to_a
    while @player_board.valid_placement?(@player_cruiser, player_cruiser_input) == false
      puts "ERROR: Enter the squares for the Cruiser (3 spaces):"
      puts @player_board.render(true)
      player_cruiser_input = input.split(" ").to_a
    end
    @player_board.place(@player_cruiser, player_cruiser_input)
    puts @player_board.render(true)
    puts "Enter the squares for the Submarine (2 spaces):"
    player_submarine_input = input.split(" ").to_a
    while @player_board.valid_placement?(@player_submarine, player_submarine_input) == false
      puts "ERROR: Enter the squares for the Submarine (2 spaces):"
      puts @player_board.render(true)
      player_submarine_input = input.split(" ").to_a
    end
    @player_board.place(@player_submarine, player_submarine_input)
    puts @player_board.render(true)
  end

  def input
    gets.chomp
  end

  def computer_ship_placement
    placement_array = computer_ship_coordinate(@computer_cruiser)
    @computer_board.place(@computer_cruiser, placement_array)
    submarine_placement_array = computer_ship_coordinate(@computer_submarine)
    while @computer_board.valid_placement?(@computer_submarine, submarine_placement_array) == false
      submarine_placement_array = computer_ship_coordinate(@computer_submarine)
    end
    @computer_board.place(@computer_submarine, submarine_placement_array)
  end


  def computer_ship_coordinate(ship_to_place)
    board_max = @computer_board.cells.keys.max.chars.first.ord
    range_alpha = (65..board_max)
    range_numeric = (1..(board_max - 64))
    die_roll = rand(1..2)
    if die_roll == 1
      ship_placement_randomizer(ship_to_place, range_alpha, range_numeric, die_roll)
    elsif die_roll == 2
      ship_placement_randomizer(ship_to_place, range_numeric, range_alpha, die_roll)
    end
  end

  def ship_placement_randomizer(ship_to_place, range_1, range_2, die_roll_pass)
    ships_arrays = []
    final_array = []
    (range_1).each_cons(ship_to_place.length) do |array|
      ships_arrays.push(array)
    end
    second_pass = rand(range_2)
    first_pass = ships_arrays.sample
    final_array = first_pass.map do |char|
      if die_roll_pass == 1
        "#{char.chr}#{second_pass.to_i}"
      else die_roll_pass == 2
        "#{second_pass.chr}#{char.to_i}"
      end
    end
  end

  def restart
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_board = Board.new

    @player_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_board = Board.new
    start
  end
end
