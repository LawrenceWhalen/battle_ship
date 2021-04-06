require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/turn"
require "./lib/game"

RSpec.describe "Turn" do
  describe "#initialize" do
    it "has the same boards as the game" do
      game = Game.new
      turn = Turn.new(game.player_board, game.computer_board)

      
      player_check = game.player_board == turn.player_board_turn
      computer_check = game.computer_board == turn.computer_board_turn


      actual = (player_check == computer_check)
      expect(actual).to eq(true)
    end
  end
end
