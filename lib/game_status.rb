class GameStatus

  class << self
    def winner?(board, character)
      finisher = finished?(board)
      finisher == character
    end

    def finished?(board)
      rows_finished?(board) || columns_finished?(board) || diagonals_finished?(board)
    end

    def rows_finished?(board)
      result = board.map{|r| r.uniq}.find{|r| r.size == 1 && !r[0].nil?}
      result ? result[0] : nil
    end

    def columns_finished?(board)
      result = (0...board.width).to_a.map do |i|
        board.map{|r| r[i]}.uniq
      end.find{|c| c.size == 1 && !c[0].nil?}

      result ? result[0] : nil
    end

    def diagonals_finished?(board)
      diagonal_one_finished?(board) || diagonal_two_finished?(board)
    end

    def diagonal_one_finished?(board)
      chars = (0...board.width).to_a.map do |i|
        board[i][i]
      end.uniq

      chars.size == 1 && !chars[0].nil? ? chars.first : nil
    end

    def diagonal_two_finished?(board)
      chars = (0...board.width).to_a.map do |i|
        board[board.width - i - 1][i]
      end.uniq
      
      chars.size == 1 && !chars[0].nil? ? chars.first : nil
    end
  end

end