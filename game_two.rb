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

  Destroyer: Alive    Cruiser: Alive    Battleship: Alive

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

  Destroyer: Alive    Cruiser: Alive    Battleship: Alive

  Please select a square (such as 3, 5) to open fire!  
  BOARD
end

# Ship
{ coordinates: [[1, 2], [1, 3], [1, 4]], alive: true, spaces_taken: [[1, 3], [1, 4]] }

# Player is randomly allocated 3 ships (1 destroyer, 1 cruiser, 1 battleship)
  # Create player's ships array
    player_ships = []
  # Create battleship and put in ships array
    player_battleship = { coordinates: [[1, 2], [1, 3], [1, 4]], alive: true, spaces_taken: [] }
  # Create cruiser and put in ships array
    player_cruiser = { coordinates: [[1, 5], [2, 5]], alive: true, spaces_taken: [] }
  # Create destroyer and put in ships array
    player_destroyer = { coordinates: [1, 5], alive: true }

# Computer is randomly allocated 3 ships (1 destroyer, 1 cruiser, 1 battleship)
  # Create player's ships array
    computer_ships = []
  # Create battleship and put in ships array
    computer_battleship = { coordinates: [[1, 2], [1, 3], [1, 4]], alive: true, spaces_taken: [] }
  # Create cruiser and put in ships array
    computer_cruiser = { coordinates: [[1, 5], [2, 5]], alive: true, spaces_taken: [] }
  # Create destroyer and put in ships array
    computer_destroyer = { coordinates: [1, 5], alive: true }
    
# Player is given a blank board
  @player_board = []
  5.times { @player_board << [" ", " ", " ", " ", " "] }

# Computer is given a blank board
  @computer_board = []
  5.times { @computer_board << [" ", " ", " ", " ", " "] }

  display_board

# Loop
  loop do
  # Player picks a square using coordinates (e.g., 3, 4)
    player_guess = gets.chomp.split(",").map(&:strip).map(&:to_i)
    # If square is occupied by one of the coordinates of a battleship, then an X is placed in that square
      if computer_battleship[:coordinates].include?(player_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        computer_battleship[:spaces_taken] << player_guess
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
        if computer_battleship[:spaces_taken].size == 3
          computer_battleship[:alive] = false
        end
      # put X in player_board in correct position
        @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
      end
    # If square is occupied by one of the coordinates of a cruiser, then an X is placed in that square
      if computer_cruiser[:coordinates].include?(player_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        computer_cruiser[:spaces_taken] << player_guess
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
        if computer_cruiser[:spaces_taken].size == 2
          computer_cruiser[:alive] = false
        end
      # put X in player_board in correct position
        @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
      end
    # If square is occupied by one of the coordinates of a destroyer, then an X is placed in that square
      if computer_destroyer[:coordinates].include?(player_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        computer_destroyer[:spaces_taken] << player_guess
      # Change the status of that boat to Sunk
        computer_destroyer[:alive] = false
      # put X in player_board in correct position
        @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "X"
      end

    # Else, a / is placed in that square
      if !computer_destroyer[:coordinates].include?(player_guess) && !computer_cruiser[:coordinates].include?(player_guess) && !computer_battleship[:coordinates].include?(player_guess) 
        @computer_board[player_guess[0] - 1][player_guess[1] - 1] = "/"
      end
    # Has the player won?

  # Computer picks a square using coordinates (e.g., 3, 4)
    computer_guess = [[1, 1], [2, 1], [3, 1], [4, 5], [5, 1], [5, 2], [2, 4]].shuffle.shift
    # If square is occupied by one of the coordinates of a battleship, then an X is placed in that square
      if player_battleship[:coordinates].include?(computer_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        player_battleship[:spaces_taken] << computer_guess
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
        if player_battleship[:spaces_taken].size == 3
          player_battleship[:alive] = false
        end
      # put X in player_board in correct position
        @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
      end
    # If square is occupied by one of the coordinates of a cruiser, then an X is placed in that square
      if player_cruiser[:coordinates].include?(computer_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        player_cruiser[:spaces_taken] << computer_guess
      # Is the boat which was hit sunk now? If so, then change the status of that boat to Sunk
        if player_cruiser[:spaces_taken].size == 2
          player_cruiser[:alive] = false
        end
      # put X in player_board in correct position
        @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
      end
    # If square is occupied by one of the coordinates of a destroyer, then an X is placed in that square
      if player_destroyer[:coordinates].include?(computer_guess)
      # Keep a record of which coordinates of a boat have been occupied and which are still free
        player_destroyer[:spaces_taken] << computer
      # Change the status of that boat to Sunk
        player_destroyer[:alive] = false
      # put X in player_board in correct position
        @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "X"
      end

    # Else, a / is placed in that square
      if !player_destroyer[:coordinates].include?(computer_guess) && !player_cruiser[:coordinates].include?(computer_guess) && !player_battleship[:coordinates].include?(computer_guess) 
        @player_board[computer_guess[0] - 1][computer_guess[1] - 1] = "/"
      end

    display_board
  end

# Show the board
