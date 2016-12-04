class Game

  def initialize board: Board.new
    @board = board
    @players = [HumanPlayer.new, AIPlayer.new].shuffle
    @move = -1
  end

  def next_move
    @move += 1
    player = @players[@move % 2]
    character = Board::CHARACTERS[@move % 2]

    request_move_for(player, character)
  end

  def request_move_for(player, character)
    player.request_move(@board, character)
  end

end
