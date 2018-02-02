require_relative 'node'

class Graph

  attr_accessor :city_list

  def initialize
    self.visited = []
    self.city_list = []
  end

  # Nearest possible neighbor
  def nearest_neighbor(current_city)
    count = 0
    while current_city.visited == false do
      #puts current_city.name
      neighbor_cities = current_city.neighbors
      #puts neighbor_cities
      next_city = neighbor_cities[0][0]
      distance = neighbor_cities[0][1]
      for current_neighbor in neighbor_cities do
        if current_neighbor[1] < distance
          next_city = current_neighbor[0]
        end
      end
      puts next_city.name
      self.city_list.push(current_city.name)
      current_city.visited = true
      current_city = next_city
      #puts current_city.name
      count += 1
      puts count
    end
    return self.city_list
  end
end
