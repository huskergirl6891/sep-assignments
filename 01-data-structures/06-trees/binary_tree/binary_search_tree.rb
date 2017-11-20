require_relative 'node'

class BinarySearchTree

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    temp = root
    # found a leaf node with no children
    if temp.right == nil && temp.left == nil
      # insert node based upon data value (< or > temp)
      if node.rating > temp.rating
        temp.right = node
      else
        temp.left = node
      end
    # not at leaf node so need to keep traversing
    else
      # compare data to temp data to determine direction to traverse
      # if node is greater than current node, go to the right
      if node.rating > temp.rating
        # if temp node has empty right side, add to right
        if temp.right == nil
          temp.right = node
        # if right side is not empty, keep traversing graph to the right
        else
          temp = temp.right
          insert(temp, node)
        end
      # otherwise, node is less than current node so go to the left
      else
        # if temp node has empty left side, add to left
        if temp.left == nil
          temp.left = node
        # if left side is not empty, keep traversing graph to the left
        else
          temp = temp.left
          insert(temp, node)
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    temp = root

    # no data should return nil
    if data == nil
      return nil

    # base case where current node matches the data to be found
    elsif temp.title == data
      return temp

    # found a leaf node so can't go any further
    # elsif temp.left == nil && temp.right == nil
    #   puts "Found leaf node"

    # if no match found, keep traversing tree
    else
      # if both children exist, need to check both sides
      if temp.right != nil && temp.left != nil
        temp1 = temp.right
        puts "temp1 = " + temp1.title if temp != nil
        find(temp1, data)
        temp2 = temp.left
        puts "temp2 = " + temp2.title if temp != nil
        find(temp2, data)
      elsif temp.right != nil
        temp = temp.right
        puts "temp right = " + temp.title if temp != nil
        find(temp, data)
      # if no path to the right exists, go to the left
      elsif temp.left != nil
        temp = temp.left
        puts "temp left = " + temp.title if temp != nil
        find(temp, data)
      # else
      #   puts "Found leaf node"
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

    # if no left child, replace node to be deleted with right child
    elsif tempNode.left == nil
      tempNode.title = tempNode.right.title
      tempNode.rating = tempNode.right.rating
      tempNode.right.title = nil
      tempNode.right.rating = nil
      tempNode.right = nil

    # if no right child, replace node to be deleted with left child
    elsif tempNode.right == nil
      tempNode.title = tempNode.left.title
      tempNode.rating = tempNode.left.rating
      tempNode.left.title = nil
      tempNode.left.rating = nil
      tempNode.left = nil

    # both left and right children exist, still replace with left child
    else
      tempNode.title = tempNode.left.title
      tempNode.rating = tempNode.left.rating
      tempNode.left.title = nil
      tempNode.left.rating = nil
      tempNode.left = nil
    end

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    # first iteration adds root as first level of children array
    if children == nil
      children = [self.root]
    end

    # print last level of array and check if children exist
    childrenExist = false
    for i in children do
      puts i.title + ": " + i.rating.to_s
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

  # returns the child node of "node" with the smallest rating
  def findMin(node)
    temp = node
  end
end
