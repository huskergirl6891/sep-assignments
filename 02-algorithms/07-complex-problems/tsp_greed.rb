require_relative 'node'

class Graph

  attr_accessor :city_list

  def initialize
    #self.cities_visited = []
    self.city_list = []
  end

  # Nearest possible neighbor
  def nearest_neighbor(current_city)
    count = 0
    while current_city.visited == false do
      neighbor_cities = current_city.neighbors
      next_city = neighbor_cities[0][0]
      distance = neighbor_cities[0][1]

      neighbor_cities.each_with_index do |current_neighbor, index|
        if next_city.visited == true || current_neighbor[0].visited == false && current_neighbor[1] < distance
          next_city = current_neighbor[0]
        end
      end
      self.city_list.push(current_city.name)
      current_city.visited = true
      current_city = next_city
      count += 1
    end
    print self.city_list
    return self.city_list
  end
end
