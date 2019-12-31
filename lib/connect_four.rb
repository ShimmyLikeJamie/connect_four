class Game
  attr_reader :width, :height, :p1_game_piece, :p2_game_piece
  attr_accessor :cage
  def initialize

    @width = 7
    @height = 6
    @cage = Array.new(@width, Array.new(@height, " ")) #Cage is a 7x6 2d array
  end

  def display_cage
    i = self.height - 1
    while i >= 0
      self.cage.each do |x|
        print "|#{x[i]}|"
      end
      puts ""
      i -= 1
    end
    7.times do |x|
      print " #{x + 1} "
    end
    puts ""
  end

  def take_turn p1_turn = true
    print "Pick a column (1-7) to drop a piece into!: "
    user_input = gets.chomp.to_i
    until user_input >= 1 && user_input <= 7
      print "Invalid input, try again: "
      user_input = gets.chomp.to_i        
    end
    if p1_turn
    else
    end
  end
end

puts "Hello welcome to connect four."

#New game
game = Game.new
game.display_cage
game.take_turn