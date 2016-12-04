class AIPlayer
  def initialize strategy: Strategies::Minimax.new
    @strategy = strategy
  end

  def request_move(board, character)
    @strategy.find_best_move(board, character)
  end
end