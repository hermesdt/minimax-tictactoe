class AIPlayer
  def initialize strategy: Strategies::Minimax.new
    @strategy = strategy
  end

  def request_move(board, character)
    coords, score = @strategy.find_best_move(board, character)
    coords
  end
end
