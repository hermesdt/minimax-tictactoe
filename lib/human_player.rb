class HumanPlayer
  def initialize on_request_move
    @on_request_move = on_request_move
  end

  def request_move(board, character)
    @on_request_move.call(board, character)
  end
end