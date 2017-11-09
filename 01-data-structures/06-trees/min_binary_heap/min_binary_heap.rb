require_relative 'node'

class MinBinaryHeap

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, data)
    temp = root
    # find end of heap
    while temp.left != nil && temp.right != nil
      if temp.left.left == nil || temp.left.right == nil
        temp = temp.left
      elsif temp.right.left == nil || temp.right.right == nil
        temp = temp.right
      else
        temp = temp.left
      end
    end
    # insert new data
    if temp.left == nil
      temp.left = data
    else
      temp.right = data
    end
    # check for heap property
    if temp.rating > data.rating
      self.root = data if temp == root
      if temp.left == data
        data.left = temp
        temp.left = nil
      else
        data.right = temp
        temp.right = nil
      end
    end
    puts "Root = " + self.root.title
    puts "Root left = " + self.root.left.title if self.root.left != nil
    puts "Root right = " + self.root.right.title if self.root.right != nil
    puts "Root left-left = " + self.root.left.left.title if self.root.left.left != nil
    puts "Root left-right = " + self.root.left.right.title if self.root.left.right != nil
    puts "**********"
  end

  def find(root, data)
    temp = root
    puts "temp = " + temp.title if temp != nil
    # no data should return nil
    if data == nil
      return nil
    # base case where current node matches the data to be found
    elsif temp.title == data
      return temp
    # if no match found, keep traversing tree
    else
      # always look for a path to the left first
      if temp.left != nil
        temp = temp.left
        find(temp, data)
      # if no path to the left exists, go to the right
      elsif temp.right != nil
        temp = temp.right
        find(temp, data)
      # if no path to right or left exists
      else
        return nil
      end
    end
  end

  def delete(root, data)

  end

  def printf(children=nil)

  end

end
