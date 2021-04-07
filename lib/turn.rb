require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/game"

class Turn
  attr_reader :player_board_turn,
              :computer_board_turn,
              :cheat

  def initialize(player_board, computer_board)
    @player_board_turn = player_board
    @computer_board_turn = computer_board
    @cheat = false
  end

  def start_turn
    line_long
    puts "Enter the coordinate for your shot:"
    player_shot = gets.chomp.upcase
    player_choice_valid = false
    while player_choice_valid == false
      if player_shot == "CHEATER"
        @cheat = true
        display_boards_now
        puts "cheats enabled, take your shot captain:"
        player_shot = gets.chomp.upcase
      elsif @computer_board_turn.cells[player_shot].fired_upon? == true
        display_boards_now
        puts "Please choose a space you haven't fired at:"
        player_shot = gets.chomp.upcase
      elsif @computer_board_turn.valid_coordinate?(player_shot) == false
        display_boards_now
        puts "Please enter a space on the board:"
        player_shot = gets.chomp.upcase
      else
        player_choice_valid = true
      end
    end

    possible_shots = []
    @player_board_turn.cells.keys.map do |coordinate|
      if @player_board_turn.cells[coordinate].fired_upon? == false
        possible_shots << coordinate
      end
    end
    computer_shot = possible_shots.sample

    [player_shot, computer_shot]
  end

  def score_board(shots_we_took, player_board_pass, computer_board_pass)
    @computer_board_turn = computer_board_pass
    @player_board_turn = player_board_pass
    display_boards_now
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
    line_long
    puts "My shot on #{computer_shot} was a #{shot_result(@player_board_turn, computer_shot)}"
  end

  def line_long
    puts "========================================"
  end

  def display_boards_now
    puts "=============COMPUTER BOARD============="
    puts @computer_board_turn.render(@cheat)
    puts "==============PLAYER BOARD=============="
    puts @player_board_turn.render(true)
    line_long
  end
end
