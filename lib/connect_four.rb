require "pry"

class Game
  attr_reader :width, :height, :p1_game_piece, :p2_game_piece
  attr_accessor :p1_turn
  def initialize
    @p1_game_piece = "\u25cf".encode('utf-8')
    @p2_game_piece = "\u25cb".encode('utf-8')
    @width = 7
    @height = 6
    @cage = Array.new(@width) { Array.new(@height, " ") } #Cage is a 7x6 2d array
    @p1_turn = true
  end

  def display_cage
    i = @height - 1
    while i >= 0
      @cage.each do |x|
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
    until @cage[x][y] == " "
      y += 1
      if y >= @height
        return "Error, column full"
      end
    end
    if @p1_turn
      @cage[x][y] = @p1_game_piece
      @p1_turn = false
    else
      @cage[x][y] = @p2_game_piece
      @p1_turn = true
    end
  end

  def win?
    return self.vertical_pass || self.horizontal_pass || self.diagonal_pass
  end

  def vertical_pass
    piece = nil
    counter = 0

    @cage.each do |column|
      column.each do |x|
        if x == " "
          next
        else
          if counter == 4
            return true
          else
            if x == piece
              counter += 1
            else
              piece = x
              counter = 1
            end
          end
        end
      end
      counter = 0
    end
    false
  end

  def horizontal_pass
    piece = nil
    x = 0
    y = 0
    counter = 0

    until y >= self.height
      until x >= self.width
        if @cage[x][y] == " "
        elsif @cage[x][y] == piece
          counter += 1
          if counter == 4
            return true
          end
        else
          piece = @cage[x][y]
          counter = 1
        end
        x += 1
      end
      counter = 1
      x = 0
      y += 1
    end
    false
  end

  def diagonal_pass
    false
  end
end


puts "Hello welcome to connect four."

#New game
game = Game.new
game.display_cage
loop do
  game.take_turn
  binding.pry
  game.display_cage
  if game.win?
    break
  end
end