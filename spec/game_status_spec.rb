describe GameStatus do

  3.times do |i|
    it "should return true for row #{i}" do
      board = Board.new(width: 3)
      board[i] = ['X']*3
      expect(GameStatus.finished?(board)).to eq("X")
    end
  end

  3.times do |i|
    it "should return true for column #{i}" do
      board = Board.new(width: 3)
      board.each{|r| r[i] = 'X'}
      expect(GameStatus.finished?(board)).to eq("X")
    end
  end

  it "should return true for diagonal one" do
    board = Board.new(width: 3)
    3.times do |i|
      board.each{|r| r[i] = 'X'}
    end

    expect(GameStatus.finished?(board)).to eq("X")
  end

  it "should return true for diagonal two" do
    board = Board.new(width: 3)
    3.times do |i|
      board[3 - i - 1][i] = 'X'
    end

    expect(GameStatus.finished?(board)).to eq("X")
  end

  3.times do |i|
    it "should return true requesting the winner for 'X' #{i}" do
      board = Board.new(width: 3)
      board[i] = ['X']*3
      expect(GameStatus.winner?(board, 'X')).to be(true)
    end
  end

  3.times do |i|
    it "should return false requesting the winner for 'O' #{i}" do
      board = Board.new(width: 3)
      board[i] = ['X']*3
      expect(GameStatus.winner?(board, 'Y')).to be(false)
    end
  end
end
