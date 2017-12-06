require_relative 'node'

class Graph

  attr_accessor :visited
  attr_accessor :bacon_list

  def initialize
    self.visited = []
    self.bacon_list = []
  end

  def find_kevin_bacon(node_start)
    # if kevin bacon connection is found, return array of films
    if(is_kevin_bacon_connection(node_start))
      return self.bacon_list
    # otherwise return nil since no connection was found
    else
      return nil
    end
  end

  def is_kevin_bacon_connection(node_start)
    # Find the Baconator
    # Check if node has been visited already
    if self.visited.include? node_start.name
      return false
    end
    # If not visited, add node to visited array
    self.visited.push(node_start.name)
    # Check if node is Kevin Bacon
    if node_start.name == "Kevin Bacon"
      return true
    end
    # If node is not Kevin Bacon, use DFS to recursively search children of current node
    for film in node_start.film_actor_hash.keys do
      for child in node_start.film_actor_hash[film] do
        if find_kevin_bacon(child)
          if self.bacon_list.include? film
          else
            self.bacon_list.push(film)
          end
          return true
        end
      end
    end
    return false
  end
end
