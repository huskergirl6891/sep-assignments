include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:ed_harris) { Node.new("Ed Harris") }
  let (:russell_crowe) { Node.new("Russell Crowe") }
  let (:jennifer_connelly) { Node.new("Jennifer Connelly") }
  let (:christian_bale) { Node.new("Christian Bale") }
  let (:heath_ledger) { Node.new("Heath Ledger") }
  let (:film_graph) { Graph.new() }

  before do
    kevin_bacon.film_actor_hash["Footloose"] = [lori_singer, john_lithgow, dianne_wiest]
    kevin_bacon.film_actor_hash["Apollo 13"] = [tom_hanks, bill_paxton, ed_harris]
    lori_singer.film_actor_hash["Footloose"] = [john_lithgow, dianne_wiest, kevin_bacon]
    ed_harris.film_actor_hash["Apollo 13"] = [tom_hanks, bill_paxton, kevin_bacon]
    ed_harris.film_actor_hash["A Beautiful Mind"] = [russell_crowe, jennifer_connelly]
    russell_crowe.film_actor_hash["A Beautiful Mind"] = [ed_harris, jennifer_connelly]
    christian_bale.film_actor_hash["The Dark Knight"] = [heath_ledger]
  end

  describe "#find_kevin_bacon(data)" do
    it "finds kevin bacon when actor is connected by same film" do
      expect(film_graph.find_kevin_bacon(lori_singer)).to eq ["Footloose"]
    end

    it "finds kevin bacon when actor is two films away" do
      expect(film_graph.find_kevin_bacon(russell_crowe)).to eq ["A Beautiful Mind", "Apollo 13"]
    end

    it "finds nil when actor is not tied to Kevin Bacon" do
      expect(film_graph.find_kevin_bacon(christian_bale)).to eq nil
    end
  end
end
