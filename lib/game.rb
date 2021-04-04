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
  end


def score_board(shots_we_took)
  puts "=============COMPUTER BOARD============="
  puts @computer_board.render
  puts "==============PLAYER BOARD=============="
  puts @player_board.render(true)
  results_of_shots(shots_we_took[0], shots_we_took[1])
end

def shot_result(board_shot_at, shot_taken)
  if board_shot_at.cells[shot_taken].ship == nil
    "miss."
  elsif board_shot_at.cells[shot_taken].ship_sunk?
    "hit, and sunk the ship!"
  else
    "hit!"
  end
end

def results_of_shots(player_shot, computer_shot)
  puts "Your shot on #{player_shot} was a #{shot_result(@computer_board, player_shot)}"
  puts "My shot on #{computer_shot} was a #{shot_result(@player_board, computer_shot)}"
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
    score_board(turn_shots_taken)
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

  def computer_ship_coordinate(ship_to_place)
    ships_arrays = []
    final_array = []
    die_roll = rand(1..2)
    if die_roll == 1
      (65..68).each_cons(ship_to_place.length) {|array| ships_arrays.push(array)}
      collum = rand(1..4)
      row = ships_arrays.sample
      final_array = row.map do |char|
      char.chr + collum.to_s
      end
    else
      (1..4).each_cons(ship_to_place.length) {|array| ships_arrays.push(array)}
      collum = rand(65..68)
      row = ships_arrays.sample
      final_array = row.map do |char|
        collum.chr + char.to_s
      end
    end
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
end
