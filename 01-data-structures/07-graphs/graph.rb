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
    # Check if node has been visited already
    if self.visited.include? node_start.name
      puts node_start.name + " visited"
      return false
    end
    # If not visited, add node to visited array
    self.visited.push(node_start.name)
    # Check if node is Kevin Bacon
    if node_start.name == "Kevin Bacon"
      puts "found"
      return true
    end
    # If node is not Kevin Bacon, use DFS to recursively search children of current node
    for film in node_start.film_actor_hash.keys do
      puts "outer loop = " + film
      puts "outer loop node = " + node_start.name
      for child in node_start.film_actor_hash[film] do
        if find_kevin_bacon(child)
          puts "inner loop name = " + child.name
          self.bacon_list.push(film)
          puts self.bacon_list
          puts "***********"
        end
        return self.bacon_list
      end
    end
    return nil
  end
end

#result ==> ["Footloose", "Apollo 13"]

# Test for negative cases (actors/films) that Kevin Bacon does not have a connection with to make sure returns nil
# Couple of ways to implement:
# # 1. Iterative
# # 2. Recursion (DFS or BFS).  If BFS, use similar to printf functions in Trees using an array ("queue") for each level.
# #    In some implmenetations, can use a flag to show that a node has been visited.
