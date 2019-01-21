class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  [0, 4, 8],
  [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, token = "X")
    @board[position] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " " || "" || nil
      return false
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      return false
    end
    if index.between?(0, 8)
      return true
    end
  end

  def turn()
    current_player()
    puts "Please enter 1-9:"
    user_input = gets.strip
    i_to_i = input_to_index(user_input)
    if valid_move?(i_to_i)
      puts "valid move"
      if turn_count().even?
        token = "X"
      else
        token = "O"
      end
      move(i_to_i, token)
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    counter = 0
    @board.each do |move|
      if move == "X" || move == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player()
    if turn_count().even?
      return "X"
    else
      return "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return win_combination
        end
      end
    return false
  end

  def full?()
    @board.all? { |player| player == "X" || player == "O" }
  end

  def draw?()
    if won?()
      return false
    elsif full?()
      return true
    end
  end

  def over?()
    if draw?()
      return true
    elsif won?()
      return true
    elsif full?()
      return true
    end
  end

  def winner()
    if won?()
      xcount = @board.count("X")
      ocount = @board.count("O")
      if xcount > ocount
        return "X"
      else
        return "O"
      end
    end
  end

  def play()
    while !over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end
