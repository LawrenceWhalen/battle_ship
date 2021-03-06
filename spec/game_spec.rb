require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/turn"
require "./lib/game"

RSpec.describe "Game" do
  describe "#initialize" do
    it "creates an instance a game" do
      game = Game.new

      expect(game.class).to eq(Game)
    end
    it "creates two boards" do
      game = Game.new

      expect(game.computer_board.class).to eq(Board)
      expect(game.player_board.class).to eq(Board)
    end
    it "creates two ships per player" do
      game = Game.new

      actual = []
      actual.push(@computer_submarine, @computer_cruiser, @player_cruiser, @player_submarine)

      expect(actual.count).to eq(4)
    end
  end
  describe "#computer_ship_placement" do
    it "places both computers ships on the board" do
      game = Game.new

      game.computer_ship_placement

      actual = game.computer_board.cells.values.map {|i| i.empty?}
      expect(actual.count(false)).to eq(5)
    end
  end
end
