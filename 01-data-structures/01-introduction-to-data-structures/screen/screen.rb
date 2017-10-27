require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []
    for j in 0..self.height
      self.matrix.insert(j,[])
      for i in 0..self.width
        self.matrix[j].insert(i,nil)
      end
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[y][x] = pixel
  end

  def at(x, y)
    self.matrix[y][x]
  end

  private

  def inbounds(x, y)
  end

end
