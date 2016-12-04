class Board
  include Enumerable

  WIDTH = 3

  attr_accessor :cells, :width

  def initialize width: WIDTH
    @width = width
    @cells = (0...WIDTH).to_a.map{ [[nil] * WIDTH] }.inject(:+)
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
end