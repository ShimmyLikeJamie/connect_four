require "./lib/connect_four"

=begin
The "stubbing" solution in order to fake keyboard input during rspec runtime
doesn't seem to work (user error probably) so I will just make a list of my inputs
1. 1
2. 1, 1, 2, 2, 3, 3, 4
3. 1, 2, 1, 2, 1, 2, 1
4. 1, 2, 2, 3, 3, 5, 3, 4, 4, 4, 4
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

  describe "#win?" do
    it "Should determine if there's a winner from a horizontally connected win" do
      game = Game.new
      7.times do
        game.take_turn
      end
      expect(game.win?).to eq(true)
    end

    it "Should determine if there's a winner from a vertically connected win" do
      game = Game.new
      7.times do
        game.take_turn
      end
      expect(game.win?).to eq(true)
    end

    it "Should determine if there's a winner from a diagonally connected win" do
      game = Game.new
      11.times do
        game.take_turn
      end
      expect(game.win?).to eq(true)
    end
  end
end