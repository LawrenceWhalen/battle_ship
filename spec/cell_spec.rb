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
    it 'returns false when a ship is placed' do
      cruiser = Ship.new('Cruiser', 3)
      cell = Cell.new('A1')

      cell.place_ship(cruiser)

      expect(cell.empty?).to eq(false)
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
  describe '#fired_upon?' do
    it 'starts out false' do
      cell = Cell.new('A1')

      expect(cell.fired_upon?).to eq(false)
    end
  end
  describe '#fire_upon' do
    it 'sets fired on to true' do
      cell = Cell.new('A1')

      cell.fire_upon

      expect(cell.fired_upon?).to eq(true)
    end
    it 'damages any ships in the cell' do
      cell = Cell.new('A1')
      cruiser = Ship.new('Cruiser', 3)

      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cruiser.health).to eq(2)
    end
  end
end
