require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    # Creates a new Node object to store the key and value for insertion
    newItem = Node.new(key, value)

    # Calculates the index based upon the key and current length of the @items array
    newIndex = index(key, @items.length)

    # Insertion into the array
    if @items[newIndex] != nil
      if @items[newIndex].head.key != nil && @items[newIndex].head.key == key
        @items[newIndex].head.value = value
      else
        @items[newIndex].add_to_tail(newItem)
      end
    else
      @items[newIndex] = LinkedList.new
      @items[newIndex].add_to_front(newItem)
    end

    # After inserting item, if new load_factor is above max, resize the array
    if load_factor > @max_load_factor
      resize
    end
    printList
  end

  def [](key)
    newIndex = index(key, @items.length)
    if @items[newIndex] != nil
      temp = @items[newIndex].head
      while temp != nil
        return temp.value if temp.key == key
        temp = temp.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    indexAscii = key.sum
    indexValue = indexAscii % size
  end

  # Calculate the current load factor
  def load_factor
    count = 0
    @items.each do |i|
      if i != nil
        temp = i.head
        while temp != nil
          count = count + 1
          temp = temp.next
        end
      end
    end
    return (count.to_f / @items.length.to_f)
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    tempItems = Array.new(2 * @items.length)
    for i in @items
      if i != nil
        temp = i.head
        while temp != nil
          tempIndex = index(temp.key, tempItems.length)
          if tempItems[tempIndex] != nil
            tempItems[tempIndex].add_to_tail(temp)
          else
            tempItems[tempIndex] = LinkedList.new
            tempItems[tempIndex].add_to_front(temp)
          end
          temp = temp.next
        end
      end
    end
    @items = tempItems
  end

  def printList
    puts "Array size = " + size.to_s
    # puts "Load factor = " + load_factor.to_s
    @items.each_with_index do |i, index|
      puts "Array slot = " + index.to_s
      print i
      puts ""
      if i != nil
        temp = i.head
        while temp != nil
          puts temp.key
          puts temp.value
          temp = temp.next
        end
      end
      puts ""
      puts ""
    end
    puts "********************"
  end
end
