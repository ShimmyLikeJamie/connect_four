require "./lib/connect_four"

=begin
The "stubbing" solution in order to fake keyboard input during rspec runtime
doesn't seem to work (user error probably) so I will just make a list of my inputs
1. 1
=end

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
      expect(game.display_cage).to eql(nil)
    end
  end

  describe "#take_turn" do
    it "Allows players to add a piece to the cage" do
      game = Game.new
      #allow($stdin).to receive(:gets).and_return("1")
      game.take_turn
      expect(game.cage[0][0]).to eq("\u25cf".encode('utf-8'))
    end
  end
end