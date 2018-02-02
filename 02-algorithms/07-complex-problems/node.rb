class Node
  attr_accessor :visited
  attr_accessor :name
  attr_accessor :neighbors

  def initialize(name)
    self.name = name
    self.visited = false
    self.neighbors = {}
  end

end
