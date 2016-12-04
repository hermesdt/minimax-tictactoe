class AIPlayer
  def initialize strategy: Strategies::Minimax.new
    @strategy = strategy
  end
end