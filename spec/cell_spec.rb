require './lib/ship'
require './lib/cell'

RSpec.describe do
  describe '#initialize' do
    it 'creates instance of Cell' do
      cell = Cell.new('A1')

      expect(cell).to be_instance_of(Cell)
    end
    it 'starts without an ship' do
      cell = Cell.new('A1')

      expect(cell.ship).to eq(nil)
    end
  end

  describe '#empty?' do
    it 'returns true when empty' do
      cell = Cell.new('A1')

      expect(cell.empty?).to eq(true)
    end
  end
  describe '#place_ship' do
    it 'places the a ship in the cell' do
      cruiser = Ship.new('Cruiser', 3)
      cell = Cell.new('A1')

      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
    end
  end
end
