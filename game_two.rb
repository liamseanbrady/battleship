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
  

def display_board
  system 'clear'
  puts <<-BOARD
  Liam's Board
      1   2   3   4   5
    +---+---+---+---+---+
  1 | #{@player_board[0][0]} | #{@player_board[0][1]} | #{@player_board[0][2]} | #{@player_board[0][3]} | #{@player_board[0][4]} |
    +---+---+---+---+---+
  2 | #{@player_board[1][0]} | #{@player_board[1][1]} | #{@player_board[1][2]} | #{@player_board[1][3]} | #{@player_board[1][4]} |
    +---+---+---+---+---+
  3 | #{@player_board[2][0]} | #{@player_board[2][1]} | #{@player_board[2][2]} | #{@player_board[2][3]} | #{@player_board[2][4]} |
    +---+---+---+---+---+
  4 | #{@player_board[3][0]} | #{@player_board[3][1]} | #{@player_board[3][2]} | #{@player_board[3][3]} | #{@player_board[3][4]} |
    +---+---+---+---+---+
  5 | #{@player_board[4][0]} | #{@player_board[4][1]} | #{@player_board[4][2]} | #{@player_board[4][3]} | #{@player_board[4][4]} |
    +---+---+---+---+---+

  Destroyer: #{@player_destroyer[:status]}    Cruiser: #{@player_cruiser[:status]}    Battleship: #{@player_battleship[:status]}

  R2D2's Board:
      1   2   3   4   5
    +---+---+---+---+---+
  1 | #{@computer_board[0][0]} | #{@computer_board[0][1]} | #{@computer_board[0][2]} | #{@computer_board[0][3]} | #{@computer_board[0][4]} |
    +---+---+---+---+---+
  2 | #{@computer_board[1][0]} | #{@computer_board[1][1]} | #{@computer_board[1][2]} | #{@computer_board[1][3]} | #{@computer_board[1][4]} |
    +---+---+---+---+---+
  3 | #{@computer_board[2][0]} | #{@computer_board[2][1]} | #{@computer_board[2][2]} | #{@computer_board[2][3]} | #{@computer_board[2][4]} |
    +---+---+---+---+---+
  4 | #{@computer_board[3][0]} | #{@computer_board[3][1]} | #{@computer_board[3][2]} | #{@computer_board[3][3]} | #{@computer_board[3][4]} |
    +---+---+---+---+---+
  5 | #{@computer_board[4][0]} | #{@computer_board[4][1]} | #{@computer_board[4][2]} | #{@computer_board[4][3]} | #{@computer_board[4][4]} |
    +---+---+---+---+---+

  Destroyer: #{@computer_destroyer[:status]}    Cruiser: #{@computer_cruiser[:status]}    Battleship: #{@computer_battleship[:status]}

  Please select a square (such as 3, 5) to open fire!  
  BOARD
end

player_ships = []
@player_battleship = { coordinates: [[1, 2], [1, 3], [1, 4]], status: "Alive", spaces_taken: [] }
@player_cruiser = { coordinates: [[1, 5], [2, 5]], status: "Alive", spaces_taken: [] }
@player_destroyer = { coordinates: [1, 5], status: "Alive" }

computer_ships = []
@computer_battleship = { coordinates: [[1, 2], [1, 3], [1, 4]], status: "Alive", spaces_taken: [] }
@computer_cruiser = { coordinates: [[1, 5], [2, 5]], status: "Alive", spaces_taken: [] }
@computer_destroyer = { coordinates: [1, 5], status: "Alive" }
  
@player_board = []
5.times { @player_board << [" ", " ", " ", " ", " "] }

@computer_board = []
5.times { @computer_board << [" ", " ", " ", " ", " "] }

computer_possible_moves = (1..5).to_a.product((1..5).to_a)

display_board

loop do
  player_guess = gets.chomp.split(",").map(&:strip).map(&:to_i)

  if @computer_battleship[:coordinates].include?(player_guess)
    @computer_battleship[:spaces_taken] << player_guess
    if @computer_battleship[:spaces_taken].size == 3
      @computer_battleship[:status] = "Sunk"
    end
    @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
  end
  if @computer_cruiser[:coordinates].include?(player_guess)
    @computer_cruiser[:spaces_taken] << player_guess
    if @computer_cruiser[:spaces_taken].size == 2
      @computer_cruiser[:status] = "Sunk"
    end
    @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
  end
  if @computer_destroyer[:coordinates].include?(player_guess)
    @computer_destroyer[:spaces_taken] << player_guess
    @computer_destroyer[:status] = "Sunk"
    @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
  end

  if !@computer_destroyer[:coordinates].include?(player_guess) && !@computer_cruiser[:coordinates].include?(player_guess) && !@computer_battleship[:coordinates].include?(player_guess) 
    @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "/"
  end

  computer_guess = computer_possible_moves.shuffle.shift
  if @player_battleship[:coordinates].include?(computer_guess)
    @player_battleship[:spaces_taken] << computer_guess
    if @player_battleship[:spaces_taken].size == 3
      @player_battleship[:status] = "Sunk"
    end
    @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
  end
  if @player_cruiser[:coordinates].include?(computer_guess)
    @player_cruiser[:spaces_taken] << computer_guess
    if @player_cruiser[:spaces_taken].size == 2
      @player_cruiser[:status] = "Sunk"
    end
    @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
  end
  if @player_destroyer[:coordinates].include?(computer_guess)
    @player_destroyer[:spaces_taken] << computer
    @player_destroyer[:status] = "Sunk"
    @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
  end

  if !@player_destroyer[:coordinates].include?(computer_guess) && !@player_cruiser[:coordinates].include?(computer_guess) && !@player_battleship[:coordinates].include?(computer_guess) 
    @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "/"
  end

  display_board
end


# Ship
# Player is randomly allocated 3 ships (1 destroyer, 1 cruiser, 1 battleship)
  # Create player's ships array
  # Create battleship and put in ships array
  # Create cruiser and put in ships array
  # Create destroyer and put in ships array
# Computer is randomly allocated 3 ships (1 destroyer, 1 cruiser, 1 battleship)
  # Create player's ships array
  # Create battleship and put in ships array
  # Create cruiser and put in ships array
  # Create destroyer and put in ships array
# Player is given a blank board
# Computer is given a blank board
# Loop
  # Player picks a square using coordinates (e.g., 3, 4)
    # If square is occupied by one of the coordinates of a battleship, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
      # put X in player_board in correct position
    # If square is occupied by one of the coordinates of a cruiser, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
      # put X in player_board in correct position
    # If square is occupied by one of the coordinates of a destroyer, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Change the status of that boat to Sunk
      # put X in player_board in correct position
    # Else, a / is placed in that square
    # Has the player won?
  # Computer picks a square using coordinates (e.g., 3, 4)
    # If square is occupied by one of the coordinates of a battleship, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
      # put X in player_board in correct position
    # If square is occupied by one of the coordinates of a cruiser, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
      # put X in player_board in correct position
    # If square is occupied by one of the coordinates of a destroyer, then an X is placed in that square
      # Keep a record of which coordinates of a boat have been occupied and which are still free
      # Change the status of that boat to Sunk
      # put X in player_board in correct position
    # Else, a / is placed in that square
    # Show the board
