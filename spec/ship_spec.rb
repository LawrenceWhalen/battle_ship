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
end
