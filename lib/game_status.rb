# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # top row wins
  [3,4,5], # middle row wins
  [6,7,8], # bottom row wins
  [0,3,6], # left column wins
  [1,4,7], # middle column wins
  [2,5,8], # right column wins
  [0,4,8], # left diagonal wins
  [2,4,6]  # right diagnol wins
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] # grab each index from each child array
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] # load the value onto the board
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    else 
      return false
    end
  end 
end

## won? method should accept a board as an argument and return false/nil if there is no win combination present in the board
## returns how they won -- by means of the winning combination.
## iterate over the possible win combinations defined in WIN_COMBINATIONS and check if the board has the same player token in each index of a winning combination.

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  if full?(board)
    return true
  elsif won?(board)
    return false
  else return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end
    