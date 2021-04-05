require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/game"

class Turn
  attr_reader :player_board_turn,
              :computer_board_turn

  def initialize(player_board, computer_board)
    @player_board_turn = player_board
    @computer_board_turn = computer_board
  end

  def start_turn
    puts "Enter the coordinate for your shot:"
    # player_shot = gets.chomp
    # player_choice_valid = false
    # while player_choice_valid == false
    #   if  @computer_board_turn.valid_coordinate?(player_shot) == false
    #     puts "Please enter a valid coordinate:"
    #     player_shot = gets.chomp
    #   elsif @computer_board_turn.cells[player_shot].fired_upon? == true
    #     puts "Please choosee a space you haven't fired at"
    #     player_shot = gets.chomp
    #   else
    #     player_choice_valid = true
    #   end
    # end
    player_shot = player_shot_loop

    # possible_shots = []
    # @player_board_turn.cells.keys.map do |coordinate|
    #   if @player_board_turn.cells[coordinate].fired_upon? == false
    #     possible_shots << coordinate
    #   end
    # end
    # computer_shot = possible_shots.sample

    computer_shot = computer_shot_loop


    [player_shot, computer_shot]
  end

  def player_shot_loop
    player_shot_attempt = gets.chomp
    player_choice_valid = false
    while player_choice_valid == false
      if  @computer_board_turn.valid_coordinate?(player_shot_attempt) == false
        puts "Please enter a valid coordinate:"
        player_shot_attempt = gets.chomp
      elsif @computer_board_turn.cells[player_shot_attempt].fired_upon? == true
        puts "Please choosee a space you haven't fired at"
        player_shot_attempt = gets.chomp
      else
        player_choice_valid = true
        player_shot_attempt
      end
    end
  end

  def computer_shot_loop
    possible_shots = []
    @player_board_turn.cells.keys.map do |coordinate|
      if @player_board_turn.cells[coordinate].fired_upon? == false
        possible_shots << coordinate
      end
    end
    possible_shots.sample
  end

end
