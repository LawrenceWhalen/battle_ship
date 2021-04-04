require "./lib/ship"
require "./lib/cell"

RSpec.describe do
  describe "#initialize" do
    it "creates cells on a board" do
      board = Board.new

      expect(board).to be_instance_of(Board)
    end

    it "should have a hash" do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash.class).to eq(Hash)
    end

    it "returns 16 key value pairs" do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash.keys.count).to eq(16)
      expect(cell_hash.values.count).to eq(16)
    end

    it "has keys that point to cell objects" do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash["A1"]).to be_instance_of(Cell)
    end
  end
  describe "#valid_coordinate?" do
    it "can tell that the coordinate is valid" do
      board = Board.new

      actual = board.valid_coordinate?("A1")

      expect(actual).to be(true)
    end
    it "can tell the coordinate is invalid" do
      board = Board.new

      actual = board.valid_coordinate?("A11")

      expect(actual).to be(false)
    end
  end
  describe "#valid_placement?" do
    it "checks ship length" do
        board = Board.new
        ship = Ship.new("Cruiser", 3)

        actual = board.valid_placement?(ship, ["A1", "A2", "A3"])

        expect(actual).to eq(true)
    end
    it "can tell if placement is wrong length" do
      board = Board.new
      ship = Ship.new("Submarine", 2)

      actual = board.valid_placement?(ship, ["A2", "A3", "A2"])

      expect(actual).to eq(false)
    end
    it "can tell if coordinates are consecutive" do
      board = Board.new
      ship = Ship.new("Submarine", 2)

      actual = board.valid_placement?(ship, ["A1", "A3"])

      expect(actual).to eq(false)
    end
    it "wont pass diagonal cells" do
      board = Board.new
      ship = Ship.new("Submarine", 2)

      actual = board.valid_placement?(ship, ["A1", "B2"])

      expect(actual).to eq(false)
    end
    it "does not let ships overlap" do
      board = Board.new
      ship = Ship.new("Submarine", 2)
      ship_2 = Ship.new("Cruiser", 3)

      board.place(ship, ["A1", "A2"])

      actual = board.valid_placement?(ship_2, ["A1", "B1", "C1"])
      expect(actual).to eq(false)
    end
  end
  describe "#place" do
    it "places the same ship in the cells" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      board.place(cruiser, ["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      actual = cell_1.ship == cell_2.ship
      expect(actual).to eq(true)
    end
    it "places a ship in a cell" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      board.place(cruiser, ["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
    end
  end
  describe "#render" do
    it "displays the results of cell.render on all" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      board.place(cruiser, ["A1", "A2", "A3"])
      actual = board.render

      expect(actual).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end
    it "displays hidden ships when passed true" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      board.place(cruiser, ["A1", "A2", "A3"])
      actual = board.render(true)

      expect(actual).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
