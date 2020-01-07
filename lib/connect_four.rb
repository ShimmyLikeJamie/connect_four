require "pry"

class Game
  attr_reader :width, :height, :p1_game_piece, :p2_game_piece
  attr_accessor :p1_turn, :cage
  def initialize
    @p1_game_piece = "\u25cf".encode('utf-8')
    @p2_game_piece = "\u25cb".encode('utf-8')
    @width = 7
    @height = 6
    @cage = Array.new(@width) { Array.new(@height, " ") } #cage is a 7x6 2d array
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
    if @p1_turn
      puts "Player one"
    else
      puts "Player two"
    end
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
    return [x, y]
  end

  def win? arr
    x = arr[0]
    y = arr[1]

    #check above
    if @cage[x][y] == @cage[x][y+1] && @cage[x][y+1] == @cage[x][y+2] && @cage[x][y+2] == @cage[x][y+3]
      return true
    end
    #check below
    if @cage[x][y] == @cage[x][y-1] && @cage[x][y-1] == @cage[x][y-2] && @cage[x][y-2] == @cage[x][y-3]
      return true
    end
    #check left
    if @cage[x][y] == @cage[x-1][y] && @cage[x-1][y] == @cage[x-2][y] && @cage[x-2][y] == @cage[x-3][y]
      return true
    end
    #check right
    if @cage[x][y] == @cage[x+1][y] && @cage[x+1][y] == @cage[x+2][y] && @cage[x+2][y] == @cage[x+3][y]
      return true
    end
    #check up & right
    if @cage[x][y] == @cage[x+1][y+1] && @cage[x+1][y+1] == @cage[x+2][y+2] && @cage[x+2][y+2] == @cage[x+3][y+3]
      return true
    end
    #check down & right
    if @cage[x][y] == @cage[x+1][y-1] && @cage[x+1][y-1] == @cage[x+2][y-2] && @cage[x+2][y-2] == @cage[x+3][y-3]
      return true
    end
    #check down & left
    if @cage[x][y] == @cage[x-1][y-1] && @cage[x-1][y-1] == @cage[x-2][y-2] && @cage[x-2][y-2] == @cage[x-3][y-3]
      return true
    end
    #check up & left
    if @cage[x][y] == @cage[x-1][y+1] && @cage[x-1][y+1] == @cage[x-2][y+2] && @cage[x-2][y+2] == @cage[x-3][y+3]
      return true
    end
    false
  end
end

def play_game game
  puts "Hello welcome to connect four."
  game.display_cage
  until game.win?(game.take_turn)
    game.display_cage
  end
  if game.p1_turn == false
    puts "Player one wins!"
  else
    puts "Player two wins!"
  end
end

#New game
game = Game.new
play_game(game)