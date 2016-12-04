class Board
  extend Enumerable

  WIDTH = 3

  attr_accessor :cells

  def initialize
    @cells = (0..WIDTH).to.map{ [[nil] * WIDTH] }.inject(:+)
  end

  def width
    WIDTH
  end
  alias_method :height, :width

  def [](index)
    @cells[index]
  end

  def each(&block)
    @cells.each(&block)
  end
end