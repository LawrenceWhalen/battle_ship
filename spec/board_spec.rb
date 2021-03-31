require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'creates cells on a board' do
      board = Board.new

      expect(board).to be_instance_of(Board)
    end

    it 'should have a hash' do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash.class).to eq(Hash)
    end

    it 'returns 16 key value pairs' do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash.keys.count).to eq(16)
      expect(cell_hash.values.count).to eq(16)
    end

    it 'has keys that point to cell objects' do
      board = Board.new

      cell_hash = board.cells

      expect(cell_hash["A1"]).to be_instance_of(Cell)
    end
  end
  describe '#valid_coordinate?' do
    it 'can tell that the coordinate is valid' do
      board = Board.new

      actual = board.valid_coordinate?("A1")

      expect(actual).to be(true)
    end
    it 'can tell the coordinate is invalid' do
      board = Board.new

      actual = board.valid_coordinate?("A11")

      expect(actual).to be(false)
    end
  end
  describe '#valid_placement?' do
    it 'checks ship length' do
        board = Board.new
        ship = Ship.new("Cruiser", 3)

        actual = board.valid_placement?(ship, ["A1", "A2", "A3"])

        expect(actual).to eq(true)
    end
    it 'can tell if placement is wrong length' do
      board = Board.new
      ship = Ship.new("Submarine", 2)

      actual = board.valid_placement?(ship, ["A1", "A2", "A3"])

      expect(actual).to eq(false)
    end
  end
end
