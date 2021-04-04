require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/game'

class Turn
  attr_reader :player_board,
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  def start_turn
    puts '=============COMPUTER BOARD============='
    puts @computer_board.render
    puts '==============PLAYER BOARD=============='
    puts @player_board.render(true)

    puts 'Enter the coordinate for your shot:'
    player_shot = gets.chomp
    while @computer_board.valid_coordinate?(player_shot) == false
      puts 'Please enter a valid coordinate:'
      player_shot = gets.chomp
    end
    @computer_board.cells[player_shot].fire_upon
    @player_board.cells['D1'].fire_upon
    @player_board.cells['A2'].fire_upon
    @player_board.cells['C3'].fire_upon
    possible_shots = []
    @player_board.cells.keys.map do |coordinate|
      if @player_board.cells[coordinate].fired_upon? == false
        possible_shots << coordinate
      else

      end
    end
    require "pry"; binding.pry
    computer_shot = possible_shots.sample
    @player_board.cells[computer_shot].fire_upon

    results(player_shot, computer_shot)
    [player_shot, computer_shot ]
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

  def results(player_shot, computer_shot)
    puts "Your shot on #{player_shot} was a #{shot_result(@computer_board, player_shot)}"
    puts "My shot on #{computer_shot} was a #{shot_result(@player_board, computer_shot)}"
  end

end
