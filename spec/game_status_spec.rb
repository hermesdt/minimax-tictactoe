describe GameStatus do

  3.times do |i|
    it "should return true for row #{i}" do
      board = Board.new(width: 3)
      board[i] = ['X']*3
      expect(GameStatus.finished?(board)).to be(true)
    end
  end

  3.times do |i|
    it "should return true for column #{i}" do
      board = Board.new(width: 3)
      board.each{|r| r[i] = 'X'}
      expect(GameStatus.finished?(board)).to be(true)
    end
  end

  it "should return true for diagonal one" do
    board = Board.new(width: 3)
    3.times do |i|
      board.each{|r| r[i] = 'X'}
    end

    expect(GameStatus.finished?(board)).to be(true)
  end

  it "should return true for diagonal two" do
    board = Board.new(width: 3)
    3.times do |i|
      board[3 - i - 1][i] = 'X'
    end

    expect(GameStatus.finished?(board)).to be(true)
  end
end
