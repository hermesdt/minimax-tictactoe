class GameStatus

  class << self
    def finished?(board)
      rows_finished?(board) || columns_finished?(board) || diagonals_finished?(board)
    end

    def rows_finished?(board)
      board.map{|r| r.uniq}.any?{|r| r.size == 1 && !r.nil?}
    end

    def columns_finished?(board)
      (0...board.width).to_a.map do |i|
        board.map{|r| r[i]}.uniq
      end.any?{|c| c.size == 1 && !c.nil?}
    end

    def diagonals_finished?(board)
      diagonal_one_finished?(board) || diagonal_two_finished?(board)
    end

    def diagonal_one_finished?(board)
      chars = (0...board.width).to_a.map do |i|
        board[i][i]
      end.uniq

      chars.size == 1 && !chars[0].nil?
    end

    def diagonal_two_finished?(board)
      chars = (0...board.width).to_a.map do |i|
        board[board.width - i - 1][i]
      end.uniq
      
      chars.size == 1 && !chars[0].nil?
    end
  end

end