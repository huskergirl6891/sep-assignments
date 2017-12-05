require_relative 'node'

class Graph

  attr_accessor :visited
  attr_accessor :bacon_list

  def initialize
    self.visited = []
    self.bacon_list = []
  end

  def find_kevin_bacon(node_start)
    # Find the Baconator
    if self.visited.include? node_start.name
      return false
    end
    self.visited.push(node_start.name)
    if node_start.name == "Kevin Bacon"
      puts "found"
      return true
    end
    for film in node_start.film_actor_hash.keys do
      puts "outer loop = " + film
      for child in node_start.film_actor_hash[film] do
        if find_kevin_bacon(child)
          puts "inner loop name = " + child.name
          self.bacon_list.push(film)
          puts self.bacon_list
          puts "***********"
        end
      end
    end
  end
end

#result ==> ["Footloose", "Apollo 13"]

# Test for negative cases (actors/films) that Kevin Bacon does not have a connection with to make sure returns nil
# Couple of ways to implement:
# # 1. Iterative
# # 2. Recursion (DFS or BFS).  If BFS, use similar to printf functions in Trees using an array ("queue") for each level.
# #    In some implmenetations, can use a flag to show that a node has been visited.
