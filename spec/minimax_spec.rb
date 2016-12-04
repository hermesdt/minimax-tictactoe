describe Strategies::Minimax do
  let(:strategy){ Strategies::Minimax.new }
  it "should return [0,0] as best move" do
    board = Board.new(cells: [
      ['o', nil, 'o'],
      [nil, 'x', 'o'],
      ['x', nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'x')
    expect(best_move).to eq([2, 1])
  end
end