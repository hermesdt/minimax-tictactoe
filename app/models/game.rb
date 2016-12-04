class Game

  attr_accessor :players
  attr_reader :id, :board

  def self.get_games
    @games ||= []
  end

  def self.add_game game
    self.get_games << game
  end

  def initialize board: Board.new
    @id = SecureRandom.uuid
    @board = board
    @players = []
    @move = 0
  end

  def turn_for
    @players[@move % 2]
  end

  def make_movement x, y
    cell = @board[x][y]
    if cell.nil?
      @board[x][y] = Board::CHARACTERS[@move % 2]
      @move += 1
    end
  end

  def next_player
    @players[(@move + 1) % 2]
  end

  def next_move
    player = @players[@move % 2]
    character = Board::CHARACTERS[@move % 2]

    x, y = request_move_for(player, character)
    make_movement(x, y)
  end

  def request_move_for(player, character)
    player.request_move(@board, character)
  end

  def as_json options = {}
    finished = GameStatus.finished?(self.board)
    winner = nil
    draw = false

    if finished
      if winner_character = Board::CHARACTERS.find{|c| GameStatus.winner?(self.board, c) } 
        winner = "#{self.next_player.class.name} (#{winner_character})"
      else
        draw = true
      end
    end

    {
      id: @id,
      turn: self.turn_for.class.name,
      board: @board.cells,
      finished: finished,
      winner: winner,
      winner_character: winner_character,
      draw: draw
    }
  end
end
