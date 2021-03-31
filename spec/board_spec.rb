require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'creates cells on a board' do
      board = Board.new

      expect(board).to be_instance_of(Board)
    end
  end
end
