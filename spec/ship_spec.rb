require './lib/ship'

RSpec.describe do
  describe '#initialize' do
    it 'Creates a instance of Ship' do
      cruiser = Ship.new('Cruiser', 3)

      expect(cruiser).to be_instance_of(Ship)
    end
  end
  describe '#health' do
    it 'shows cruiser health' do
      cruiser = Ship.new('Cruiser', 3)

      expect(cruiser.health).to eq(3)
    end
  end

  describe '#sunk?' do
    it 'retuns false at initialize' do
      cruiser = Ship.new('Cruiser', 3)

      expect(cruiser.sunk?).to eq(false)
    end
    it 'returns true when health is zero' do
      cruiser = Ship.new('Cruiser', 3)

      cruiser.hit
      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to eq(true)
    end
  end

  describe '#hit' do
    it 'makes health go down' do
      cruiser = Ship.new("Cruiser", 3)

      cruiser.hit

      expect(cruiser.health).to eq(2)
    end
  end
end
