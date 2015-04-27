require 'set'
require 'awesome_print'

class Tile
  attr_accessor :status

  def initialize(game_board, position)
    @game_board= game_board
    @position = position
    @bomb = false
    @flagged = false
    @revealed = false
  end

  # def update_status
  #   @game_board.each do |y_coord|
  #     y_coord.each_with_index do |tile, x_coord|
  #       if @game_board[y_coord][x_coord].is_bomb?
  #         @game_board[new_y][new_x].status += 1
  #       end
  #     end
  #   end
  # end

  def status
    #get the neighbor bomb count
  end

  def neighbors
    neighbors = []
    [-1, 0, 1].each do |mod1|
      [-1, 0, 1].each do |mod2|
        x_coor = @position[0] + mod1
        y_coor = @position[1] + mod2
        unless mod1 == 0 && mod2 == 0 && on_board?(x_coor,y_coor)
          neighbors << [x_coor , y_coor]
        end
      end
    end

    neighbors
  end

  def on_board?(x,y) #make 8 dynamic in future?
    x.between?(0,8) && y.between?(0,8)
  end

  def neighbor_bomb_count
  end
  

  def is_bomb?
    @bomb
  end

  def bomb_tile
    @bomb = true
  end

  def flag_tile
    @flagged = true
  end

  def reveal_tile
    @revealed = true
  end
end

class Board
  attr_accessor :game_board

  def initialize
    @game_board = generate_board
    # seed bombs
  end

  def generate_board
    Array.new(9) {Array.new(9) {Tile.new(@game_board)}}
  end

  def seed_bombs
    10.times do |bomb|
      x, y = (0..8).to_a.sample, (0..8).to_a.sample
      if !@game_board[y][x].is_bomb?
        @game_board[y][x] = Tile.new(@game_board, 'bomb') # TA: just update
      end
    end
    @game_board
  end
end

class Minesweeper
  def initialize
    @board = Board.new
  end

  def play
    puts "Please choose coordinates (r, f + [x,y])"
    user_input = gets.chomp
    # ...
  end

end

# p game = Board.new.seed_bombs
