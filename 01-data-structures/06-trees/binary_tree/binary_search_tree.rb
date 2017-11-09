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
    # if no match found, keep traversing tree
    else
      # always look for a path to the right first
      if temp.right != nil
        temp = temp.right
        find(temp, data)
      # if no path to the right exists, go to the left
      elsif temp.left != nil
        temp = temp.left
        find(temp, data)
      # if no path to right or left exists
      else
        return nil
      end
    end
  end

  def delete(root, data)
    return nil if data == nil
    # store node to be deleted in temp variable
    tempNode = find(root, data)
    # if node to be deleted is the root node, just set tree root to nil
    if tempNode == root
      self.root = nil
    # # otherwise, node to be deleted will have a parent

    # # check if the node is on the left leg of the parent in order to move new
    # # child to correct side of parent
    # elsif tempNode.parent.left == tempNode
    #   # check first if node to be deleted has a left child since this child will
    #   # always get moved first if it exists
    #   # if it exists, set the parent leg to point to the left child of the node to be deleted
    #   if tempNode.left != nil
    #     tempNode.parent.left = tempNode.left
    #   # if no left leg, then check if the node has a right leg and if it exists,
    #   # set the parent leg to point to the right child of the node to be deleted
    #   elsif tempNode.right != nil
    #     tempNode.parent.left = tempNode.right
    #   # otherwise, node to be deleted must not have any children so set parent
    #   # node's leg to nil
    #   else
    #     tempNode.parent.left = nil
    #   end
    # # check if node is on the right leg of the parent and follow same checks to
    # # determine which child to move up
    # elsif tempNode.parent.right == tempNode
    #   if tempNode.left != nil
    #     tempNode.parent.right = tempNode.left
    #   elsif tempNode.right != nil
    #     tempNode.parent.right = tempNode.right
    #   else
    #     tempNode.parent.right = nil
    #   end
    # end

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    # base case for root node
    # if children == nil
      temp = self.root if children == nil
      temp = children if children != nil
      # print root node (base case)
      puts temp.title + ": " + temp.rating.to_s if children == nil
      # print root node left side if exists (base case)
      if temp.left != nil
        puts temp.left.title + ": " + temp.left.rating.to_s
      end
      # print root node right side if exists (base case)
      if temp.right != nil
        puts temp.right.title + ": " + temp.right.rating.to_s
      end
      if temp.left != nil
        # if temp.left.left != nil
        #   # puts temp.left.left.title + ": " + temp.left.left.rating.to_s
        #   temp2 = temp.left.left
        #   printf(temp2)
        # end
        # if temp.left.right != nil
        #   # puts temp.left.right.title + ": " + temp.left.right.rating.to_s
        #   temp3 = temp.left.right
        #   printf(temp3)
        # end
        printf(temp.left)
      end
      if temp.right != nil
        # if temp.right.left != nil
        #   # puts temp.right.left.title + ": " + temp.right.left.rating.to_s
        #   temp3 = temp.right.left
        #   printf(temp3)
        # end
        # if temp.right.right != nil
        #   # puts temp.right.right.title + ": " + temp.right.right.rating.to_s
        #   temp4 = temp.right.right
        #   printf(temp4)
        # end
        printf(temp.right)
      end


    # else
    #   temp = children
    #   # print root node left side if exists (base case)
    #   puts temp.left.title + ": " + temp.left.rating.to_s if temp.left != nil
    #   # print root node right side if exists (base case)
    #   puts temp.right.title + ": " + temp.right.rating.to_s if temp.right != nil
    # end
    # if temp.left != nil
    #   temp2 = temp.left
    #   printf(temp2)
    # end
    # if temp.right != nil
    #   temp3 = temp.right
    #   print(temp3)
    # end

  end
end
