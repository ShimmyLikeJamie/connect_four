class Game
  attr_reader :width, :height, :p1_game_piece, :p2_game_piece
  attr_accessor :cage, :p1_turn
  def initialize
    @p1_game_piece = "\u25cf".encode('utf-8')
    @p2_game_piece = "\u25cb".encode('utf-8')
    @width = 7
    @height = 6
    @cage = Array.new(@width, Array.new(@height, " ")) #Cage is a 7x6 2d array
    @p1_turn = true
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

  def take_turn
    print "Pick a column (1-7) to drop a piece into!: "
    user_input = gets.chomp.to_i
    until user_input >= 1 && user_input <= 7
      print "Invalid input, try again: "
      user_input = gets.chomp.to_i        
    end
    y = 0
    x = user_input - 1
    until self.cage[x][y] == " "
      y += 1
      if i >= self.height
        return "Error, column full"
      end
    end
    if self.p1_turn
      self.cage[x][y] = self.p1_game_piece
      p1_turn = false
    else
      self.cage[x][y] = self.p2_game_piece
      p1_turn = true
    end
    return true
  end
end

puts "Hello welcome to connect four."

#New game
game = Game.new
game.display_cage
until game.take_turn == true
end