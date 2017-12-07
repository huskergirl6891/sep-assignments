class Node
  attr_accessor :name
  # name of an actor
  attr_accessor :film_actor_hash

  def initialize(name)
    self.name = name
    self.film_actor_hash = {}
  end

end
