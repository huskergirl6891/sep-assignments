require_relative 'node'
require 'benchmark'

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
      temp.left.parent = temp
      # puts "New node left = " + temp.left.title
      # puts "Parent = " + temp.left.parent.title
      # puts "***"
    else
      temp.right = data
      temp.right.parent = temp
      # puts "New node right = " + temp.right.title
      # puts "Parent = " + temp.right.parent.title
      # puts "***"
    end
    # check for heap property
    while temp.rating > data.rating && data != self.root
      # puts "Current data = " + data.title
      # puts "Current temp = " + temp.title
      # puts "***"
      # store parent data in temp variables
      tempTitle = temp.title
      tempRating = temp.rating

      # copy child node data to parent node
      temp.title = data.title
      temp.rating = data.rating

      # copy parent data to left or right child node
      if temp.left == data
        temp.left.title = tempTitle
        temp.left.rating = tempRating
      else
        temp.right.title = tempTitle
        temp.right.rating = tempRating
      end

      # update temp to be parent of new
      if temp == self.root
        break
      end
      data = temp
      # puts "New data = " + data.title
      temp = temp.parent
      # puts "New temp = " + temp.title if temp != nil
      # puts "***"
    end
    # puts "Root = " + self.root.title
    # puts "Root left = " + self.root.left.title if self.root.left != nil
    # puts "Root right = " + self.root.right.title if self.root.right != nil
    # puts "Root left-left = " + self.root.left.left.title if self.root.left.left != nil
    # puts "Root left-right = " + self.root.left.right.title if self.root.left.right != nil
    # puts "**********"
    # printf
    # puts "**"
  end

  def find(root, data)
    temp = root

    # no data should return nil
    if data == nil
      return nil

    # checks if current node is nil
    elsif temp == nil
      return nil

    # base case where current node matches the data to be found
    elsif temp.title == data
      return temp

    # if no match found, keep traversing tree
    else
      # if both children exist, need to check both sides
      curr = find(temp.right, data)
      if !curr.nil?
        return curr
      else
        find(temp.left, data)
      end
    end
  end

  def delete(root, data)
    return nil if data == nil
    # store node to be deleted in temp variable
    tempNode = find(root, data)

    # if no children, just delete the node
    if tempNode.left == nil && tempNode.right == nil
      tempNode.rating = nil
      tempNode.title = nil
      tempNode = nil

    # if no right child, replace node to be deleted with left child
    elsif tempNode.right == nil
      tempNode.title = tempNode.left.title
      tempNode.rating = tempNode.left.rating
      tempNode.left.title = nil
      tempNode.left.rating = nil
      tempNode.left = nil
      # still doesn't take into account if tempNode.left has children

    # if has both left and right children, replace with smallest node
    else
      if tempNode.right.rating < tempNode.left.rating
        tempNode.title = tempNode.right.title
        tempNode.rating = tempNode.right.rating
        tempNode.right.title = nil
        tempNode.right.rating = nil
        tempNode.right = nil
        # still doesn't take into account if tempNode.left has children
      else
        tempNode.title = tempNode.left.title
        tempNode.rating = tempNode.left.rating
        tempNode.left.title = nil
        tempNode.left.rating = nil
        tempNode.left = nil
        # still doesn't take into account if tempNode.left has children
      end
    end
  end

  def printf(children=nil)
    # first iteration adds root as first level of children array
    if children == nil
      children = [self.root]
    end

    # print last level of array and check if children exist
    childrenExist = false
    for i in children do
      puts i.title + ": " + i.rating.to_s if i.title != nil
      if i.left != nil || i.right != nil
        childrenExist = true
      end
    end

    # build next level of array if children exist
    if childrenExist
      newChildren = []
      for i in children do
        newChildren.push(i.left) if i.left != nil
        newChildren.push(i.right) if i.right != nil
      end
      printf(newChildren)
    end
  end
end

n = 100000
root = Node.new("title1", 1)
minBinaryHeap = MinBinaryHeap.new(root)

Benchmark.bm do |x|
  x.report("MBH_insert:") {
    for i in 2..n
      temp = Node.new("title" + i.to_s, i)
      minBinaryHeap.insert(root, temp)
    end
  }
  x.report("MBH_find:") { minBinaryHeap.find(root, "title50000") }
  x.report("MBH_delete:") { minBinaryHeap.delete(root, "title5000") }
end
