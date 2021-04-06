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

      player_check = (game.player_board == turn.player_board_turn)
      computer_check = (game.computer_board == turn.computer_board_turn)

      actual = (player_check == computer_check)
      expect(actual).to eq(true)
    end
  end
  describe "#shot_result" do
    it "passes the result of the shot" do
      game = Game.new
      turn = Turn.new(game.player_board, game.computer_board)

      actual = turn.shot_result(game.player_board, "A1")

      expect(actual).to eq("miss.")
    end
    it "passes the result of a ship hit" do
      game = Game.new
      turn = Turn.new(game.player_board, game.computer_board)
      ship = Ship.new("Cruiser", 3)
      game.player_board.place(ship, ["A1", "A2", "A3"])

      actual = turn.shot_result(game.player_board, "A1")

      expect(actual).to eq("hit!")
    end
    it "passes the result of a ship that has been hit and sunk" do
      game = Game.new
      turn = Turn.new(game.player_board, game.computer_board)
      ship = Ship.new("Cruiser", 2)
      game.player_board.place(ship, ["A1", "A2"])

      ship.hit
      ship.hit

      actual = turn.shot_result(game.player_board, "A1")

      expect(actual).to eq("hit, and sunk the ship!")
    end
  end
end
