include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }
  let (:rainbow) { Node.new("Rainbow", 89) }
  let (:butterfly) { Node.new("Butterfly Effect", 73) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      heap.insert(root, district)
      expect(root.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(root, district)
      heap.insert(root, hope)
      expect(root.right.title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new node as a left-left child" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.insert(root, mad_max_2)
      expect(root.left.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as the new parent" do
      heap.insert(root, pacific_rim)
      expect(root.left.title).to eq "The Matrix"
    end

    it "properly inserts seveal nodes" do
      heap.insert(root, pacific_rim)
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, district)
      heap.insert(root, butterfly)
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a left-left node" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a left-right node" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.insert(root, mad_max_2)
      heap.insert(root, empire)
      expect(heap.find(root, "Star Wars: The Empire Strikes Back").title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a right node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      heap.insert(root, hope)
      heap.insert(root, martian)
      expect(heap.find(root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, hope)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(root, braveheart)
      heap.insert(root, pacific_rim)
      expect(root.right.title).to eq "Braveheart"
      heap.delete(root, "The Matrix")
      expect(heap.find(root, "The Matrix")).to be_nil
    end

    it "properly deletes a left-right node and keeps heap property" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.insert(root, mad_max_2)
      heap.insert(root, empire)
      heap.printf
      expect(heap.find(root, "Star Wars: The Empire Strikes Back").title).to eq "Star Wars: The Empire Strikes Back"
      heap.delete(root, "District 9")
      expect(heap.find(root, "District 9")).to be_nil
      heap.printf
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\n"
       heap.insert(root, pacific_rim)
       heap.insert(root, braveheart)
       heap.insert(root, jedi)
       heap.insert(root, donnie)
       heap.insert(root, inception)
       heap.insert(root, district)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
