include RSpec

require_relative 'tsp_greed'

RSpec.describe Graph, type: Class do
  let (:miami) { Node.new("Miami") }
  let (:orlando) { Node.new("Orlando") }
  let (:dallas) { Node.new("Dallas") }
  let (:seattle) { Node.new("Seattle") }
  let (:graph_of_cities) { Graph.new() }

  before do
    miami.neighbors = [[orlando, 10], [dallas, 30], [seattle, 50]]
    orlando.neighbors = [[miami, 10],[dallas, 20],[seattle, 40]]
    dallas.neighbors = [[miami, 30],[orlando, 20],[seattle, 25]]
    seattle.neighbors = [[miami, 50],[orlando, 40],[dallas, 25]]
  end

  describe "#nearest_neighbor(city)" do
    it "finds nearest neighbor" do
      expect(graph_of_cities.nearest_neighbor(miami)).to eq ["Miami", "Orlando", "Dallas", "Seattle"]
    end
  end
end
