# Requirements
  # show player the ui with both boards empty - Done
  # generate three ships for the player and the computer and place them on the board (think about data structures here - might be worth doing a spike)
  # allow the player to randomly pick coordinates
  # place an x on the computer's board if the player picked correctly or a / if the square was blank
  # update the status of the ships
  # determine if the player has won
  # randomly pick square coordinates for the computer
  # place an x on the player's board if the computer picked correctly or a / if the square was blank
  # update the status of the ships
  # determine if the computer has won
  

# show player the ui with both boards empty
system 'clear'
puts <<-BOARD
Liam's Board
    1   2   3   4   5
  +---+---+---+---+---+
1 |   |   |   |   |   |
  +---+---+---+---+---+
2 |   |   |   |   |   |
  +---+---+---+---+---+
3 |   |   |   |   |   |
  +---+---+---+---+---+
4 |   |   |   |   |   |
  +---+---+---+---+---+
5 |   |   |   |   |   |
  +---+---+---+---+---+

Destroyer: Alive    Cruiser: Alive    Battleship: Alive

R2D2's Board:
    1   2   3   4   5
  +---+---+---+---+---+
1 |   |   |   |   |   |
  +---+---+---+---+---+
2 |   |   |   |   |   |
  +---+---+---+---+---+
3 |   |   |   |   |   |
  +---+---+---+---+---+
4 |   |   |   |   |   |
  +---+---+---+---+---+
5 |   |   |   |   |   |
  +---+---+---+---+---+

Destroyer: Alive    Cruiser: Alive    Battleship: Alive

Please select a square (such as 3, 5) to open fire!  
BOARD

# generate three ships for the player and the computer and place them on the board (think about data structures here - might be worth doing a spike)
player_ships = {destroyer: { coordinates: [[1, 4]], hit_coordinates: [] }, cruiser: { coordinates: [[3, 4], [4, 4]], hit_cooridnates: [] }, battleship: { coordinates: [[5, 1], [5, 2], [5, 3]], hit_coordinates: [] } }
computer_ships = {destroyer: [[1, 4]], cruiser: [[3, 4], [4, 4]], battleship: [[5, 1], [5, 2], [5, 3]]}

player_board = [[" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "]]
computer_board = [[" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "], [" ", " ", " ", " ", " "]]

# allow the player to randomly pick coordinates
# place an x on the computer's board if the player picked correctly or a / if the square was blank

# get player's move
player_move = gets.chomp.split(",").each(&:strip!).map(&:to_i)

# check if player's move was successful
if player_ships.values.map { |results| results[:coordinates] }.flatten(1).include?(player_move) 
  computer_board[player_move[0] - 1][player_move[1] -1] = "X"
  
else
  computer_board[player_move[0] - 1][player_move[1] -1] = "/"
end


# computer's move
computer_move = [1, 1]


if player_ships.values.flatten!(1).include?(computer_move) 
  player_board[computer_move[0] - 1][computer_move[1] -1] = "X"
else
  player_board[computer_move[0] - 1][computer_move[1] -1] = "/"
end

  system 'clear'
  puts <<-BOARD
  Liam's Board
      1   2   3   4   5
    +---+---+---+---+---+
  1 | #{player_board[0][0]} | #{player_board[0][1]} | #{player_board[0][2]} | #{player_board[0][3]} | #{player_board[0][4]} |
    +---+---+---+---+---+
  2 | #{player_board[1][0]} | #{player_board[1][1]} | #{player_board[1][2]} | #{player_board[1][3]} | #{player_board[1][4]} |
    +---+---+---+---+---+
  3 | #{player_board[2][0]} | #{player_board[2][1]} | #{player_board[2][2]} | #{player_board[2][3]} | #{player_board[2][4]} |
    +---+---+---+---+---+
  4 | #{player_board[3][0]} | #{player_board[3][1]} | #{player_board[3][2]} | #{player_board[3][3]} | #{player_board[3][4]} |
    +---+---+---+---+---+
  5 | #{player_board[4][0]} | #{player_board[4][1]} | #{player_board[4][2]} | #{player_board[4][3]} | #{player_board[4][4]} |
    +---+---+---+---+---+

  Destroyer: Alive    Cruiser: Alive    Battleship: Alive

  R2D2's Board:

      1   2   3   4   5
    +---+---+---+---+---+
  1 | #{computer_board[0][0]} | #{computer_board[0][1]} | #{computer_board[0][2]} | #{computer_board[0][3]} | #{computer_board[0][4]} |
    +---+---+---+---+---+
  2 | #{computer_board[1][0]} | #{computer_board[1][1]} | #{computer_board[1][2]} | #{computer_board[1][3]} | #{computer_board[1][4]} |
    +---+---+---+---+---+
  3 | #{computer_board[2][0]} | #{computer_board[2][1]} | #{computer_board[2][2]} | #{computer_board[2][3]} | #{computer_board[2][4]} |
    +---+---+---+---+---+
  4 | #{computer_board[3][0]} | #{computer_board[3][1]} | #{computer_board[3][2]} | #{computer_board[3][3]} | #{computer_board[3][4]} |
    +---+---+---+---+---+
  5 | #{computer_board[4][0]} | #{computer_board[4][1]} | #{computer_board[4][2]} | #{computer_board[4][3]} | #{computer_board[4][4]} |
    +---+---+---+---+---+

  Destroyer: Alive    Cruiser: Alive    Battleship: Alive

  Please select a square (such as 3, 5) to open fire!  
  BOARD

# update the status of the ships
  
# determine if the player has won
# randomly pick square coordinates for the computer
# place an x on the player's board if the computer picked correctly or a / if the square was blank
# update the status of the ships
# determine if the computer has won
