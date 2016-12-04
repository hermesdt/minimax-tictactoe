class Board
  include Enumerable
  CHARACTERS = ['x', 'o']

  WIDTH = 3

  attr_accessor :cells, :width

  def initialize width: WIDTH, cells: nil
    @width = width
    @cells = cells || (0...WIDTH).to_a.map{ [[nil] * WIDTH] }.inject(:+)
  end

  alias_method :height, :width

  def [](index)
    @cells[index]
  end

  def []=(index, value)
    @cells[index] = value
  end

  def each(&block)
    @cells.each(&block)
  end

  def each_possible_move(&block)
    self.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        block.call(i,j) if cell.nil?
      end
    end
  end

  def dup
    Board.new(width: self.width, cells: self.cells.map{|row| row.dup})
  end

  def to_s
    "\n" + self.map{ |row| row.map{|e| e || " "}.join("|") }.join("\n") + "\n"
  end
end