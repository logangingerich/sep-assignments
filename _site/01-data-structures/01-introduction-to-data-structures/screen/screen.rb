require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(height) { Array.new(width) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      @matrix[x][y]
    end
  end

  private

  def inbounds(x, y)
    if x < 0
      p "x is out of bounds."
      false
    elsif y < 0
      p "y is out of bounds."
      false
    else
      true
    end
  end

end
