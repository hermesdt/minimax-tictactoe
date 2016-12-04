describe AIPlayer do
  it "should call find_best_move on the strategy" do
    strategy = double(:fake_strategy)
    board = instance_double("Board")
    characer = 'X'

    expect(strategy).to receive(:find_best_move).with(board, characer)

    ai = AIPlayer.new(strategy: strategy)
    ai.request_move(board, characer)
  end
end