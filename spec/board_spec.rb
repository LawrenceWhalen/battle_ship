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
  end
end
