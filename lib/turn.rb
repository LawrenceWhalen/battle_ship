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
    player_shot = gets.chomp
    player_choice_valid = false
    while player_choice_valid == false
      if  @computer_board_turn.valid_coordinate?(player_shot) == false
        puts "Please enter a valid coordinate:"
        player_shot = gets.chomp
      elsif @computer_board_turn.cells[player_shot].fired_upon? == true
        puts "Please choosee a space you haven't fired at"
        player_shot = gets.chomp
      else
        player_choice_valid = true
      end
    end
    
    player_shot = player_shot_loop

    possible_shots = []
    @player_board_turn.cells.keys.map do |coordinate|
      if @player_board_turn.cells[coordinate].fired_upon? == false
        possible_shots << coordinate
      end
    end
    computer_shot = possible_shots.sample

    computer_shot = computer_shot_loop

    [player_shot, computer_shot]
  end
  
  def score_board(shots_we_took, player_board_pass, computer_board_pass)
    @computer_board_turn = computer_board_pass
    @player_board_turn = player_board_pass
    puts "=============COMPUTER BOARD============="
    puts @computer_board_turn.render
    puts "==============PLAYER BOARD=============="
    puts @player_board_turn.render(true)
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
    puts "Your shot on #{player_shot} was a #{shot_result(@computer_board_turn, player_shot)}"
    puts "My shot on #{computer_shot} was a #{shot_result(@player_board_turn, computer_shot)}"
  end

end
