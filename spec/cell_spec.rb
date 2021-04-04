require "./lib/ship"
require "./lib/cell"

RSpec.describe do
  describe "#initialize" do
    it "creates instance of Cell" do
      cell = Cell.new("A1")

      expect(cell).to be_instance_of(Cell)
    end
    it "starts without an ship" do
      cell = Cell.new("A1")

      expect(cell.ship).to eq(nil)
    end
  end

  describe "#empty?" do
    it "returns true when empty" do
      cell = Cell.new("A1")

      expect(cell.empty?).to eq(true)
    end
    it "returns false when a ship is placed" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("A1")

      cell.place_ship(cruiser)

      expect(cell.empty?).to eq(false)
    end
  end
  describe "#place_ship" do
    it "places the a ship in the cell" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("A1")

      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
    end
  end
  describe "#fired_upon?" do
    it "starts out false" do
      cell = Cell.new("A1")

      expect(cell.fired_upon?).to eq(false)
    end
  end
  describe "#fire_upon" do
    it "sets fired on to true" do
      cell = Cell.new("A1")

      cell.fire_upon

      expect(cell.fired_upon?).to eq(true)
    end
    it "damages any ships in the cell" do
      cell = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cruiser.health).to eq(2)
    end
  end
  describe "#render" do
    it "retuns a . if the cell has not been fired upon and does not contain a ship" do
      cell_1 = Cell.new("A1")

      expect(cell_1.render).to eq(".")
    end
    it "returns M if the cell has been fired_upon and does not contain a ship" do
      cell_1 = Cell.new("A1")

      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end
    it "returns . if the cell has not been fired upon and contains a ship" do
      cell_2 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)

      expect(cell_2.render).to eq(".")
    end
    it "returns S when a ship is in the cell and optional argument is true" do
      cell_2 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)

      actual = cell_2.render(true)
      expect(actual).to eq("S")
    end
    it "returns H if the cell has been fired upon and contains a ship" do
      cell_2 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      cell_2.fire_upon

      expect(cell_2.render).to eq("H")
    end
    it "returns X if has been fired upon and the ship and the ship has been sunk" do
      cell_2 = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      cruiser.hit
      cruiser.hit

      expect(cell_2.render).to eq("X")
    end
  end

end
