require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    temp = node
    if @head == nil
      @head = temp
      @tail = temp
    else
      @tail.next = temp
      @tail = temp
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail == nil
      return nil
    elsif @head == @tail
      @head = nil
      @tail = nil
    else
      temp = @head
      while temp.next != @tail
        temp = temp.next
      end
      @tail = temp
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    while temp != nil
      puts temp.key
      puts temp.value
      temp = temp.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @tail == nil
      return nil
    elsif @head == @tail
      @head = nil
      @tail = nil
    elsif node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      temp = @head
      while temp.next != node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = node
    if @head == nil
      @head = temp
      @tail = temp
    else
      node.next = @head
      @head = temp
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = @head.next
  end
end
