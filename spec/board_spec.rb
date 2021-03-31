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
  end
end
