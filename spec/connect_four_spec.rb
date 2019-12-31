require "./lib/connect_four"

describe Game do
  describe "#initialize" do
    it "Creates a new game board" do
      game = Game.new
      expect(game.cage).to eql(Array.new(game.width, Array.new(game.height, " ")))
    end
  end

  describe "#display_cage" do
    it "Displays the current state of the cage" do
      game = Game.new
      expect(game.display_cage).to eql(-1)
    end
  end

  describe "#take_turn" do
    it "Allows players to add a piece to the cage" do
      game = Game.new
    end
  end
end