class TicTacToe


  WIN_COMBINATIONS =[[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

  def initialize(board = nil) #board is empty
    @board = board || Array.new(9, " ") #initialize or create a new array
  end
  #it 'prints arbitrary arrangements of the board' do
    # board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
    # game = TicTacToe.new
    # game.instance_variable_set(:@board, board)
    #
    # output = capture_puts{ game.display_board }
    #
    # expect(output).to include(" X | X | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    #
    #
    # board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    # game.instance_variable_set(:@board, board)
    #
    # output = capture_puts{ game.display_board }
    #
    # expect(output).to include(" X | O | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" O | X | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" O | X | O ")

  def input_to_index(input)
    index = input.to_i
    index = index -1    #recieves choice of space and converst to index
  end


  def move(index, char)
    @board[index] = char #char is X or O person puts their char onto position
  end

  def position_taken?(index)
      @board[index]==("X") || @board[index]==("O")  #allows position if it is nil
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) #are they within the allowable ranges
  end

  def turn_count
    @board.count{|char|char=="X" || char=="O"} #total number of moves, remember at least 5 and no more than 9
    #nuboard = @board.reject { |c| c.empty? }.join
    #occupied_spaces = nuboard.count("X")+nuboard.count("O")
    #occupied_spaces
  end

  def current_player
    turn_count % 2 == 0 ? "X" :"O"  #makes sure the current player meets order.
  end



 def turn
    puts "Please choose a number between 1-9:"
    input = gets.strip                      #starts a turn, gathers input, gets index, checks if move is valid, and confirms current player.
    index = input_to_index(input)  #I have my index/space number
    if valid_move?(index)
      char=current_player
      move(index,char)
      display_board
    else
    "Please try again!"
    turn
 end
 end

 def over?
   won? || draw?
 end

 def won?

 end

 # def draw?
 #   if turn_count==9 && !won?
 #     true
 #   else
 #     false
 #   end
 # end

 def full?                              #full means a draw, someone won, or game-in-progress
  if  turn_count==9 && !won? || !draw?
    true
  else
    false
  end
  end












def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
end
