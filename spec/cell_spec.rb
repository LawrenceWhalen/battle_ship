require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'creates instance of Cell' do
      cell = Cell.new("A1")

      expect(cell).to be_instance_of(Cell)
    end
    it 'starts without an ship' do
      cell = Cell.new("A1")

      expect(cell.ship).to eq(nil) 
    end
  end


end
