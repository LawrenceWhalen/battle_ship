class ComputerAi
  attr_reader :last_good_hit,
              :hit_before_last,
              :current_player_board

  def initialize
    @last_good_hit = nil
    @hit_before_last = nil
    @current_player_board = Hash.new
  end

  def take_the_shot(current_player_board)
    @current_player_board = current_player_board
    if last_good_hit = nil
      wild_shot
    end
  end

  def wild_shot
    possible_shots = []
    @current_player_board.cells.keys.map do |coordinate|
      if @current_player_board.cells[coordinate].fired_upon? == false
        possible_shots << coordinate
      end
    end
    possible_shots.sample
  end

  def shot_was_hit
  # def work_it_back(coordinate, result)
  #   if result == hit && hit_before_last ==

end
