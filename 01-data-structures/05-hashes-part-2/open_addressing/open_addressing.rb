require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # Creates a new Node object to store the key and value for insertion
    newItem = Node.new(key, value)

    # Calculates the index based upon the key and current length of the @items array
    newIndex = index(key, @items.length)

    # Insertion into the array
    while @items[newIndex] != nil
      if next_open_index(newIndex) == -1
        resize
        newIndex = index(key, @items.length)
      else
        newIndex = next_open_index(newIndex)
      end
    end

    @items[newIndex] = newItem
    printList
  end

  def [](key)
    newIndex = index(key, @items.length)
    while (@items[newIndex].key != key)
      newIndex += 1
      if newIndex == @items.length
        newIndex = 1
      end
    end
    return @items[newIndex].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    indexAscii = key.sum
    indexValue = indexAscii % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    # Initialize variable to start checking indexes
    temp = index
    count = 0
    # While a given slot is not empty, continue checking the next index
    while @items[temp] != nil && count < @items.length
      # Using linear probing, indexes will be searched by incrementing by one
      temp += 1
      # If the end of the array has been reached, reset temp to the beginning of the array
      if temp == @items.length
        temp = 0
      end
      # If temp is empty, return the value as the new index
      if @items[temp] == nil
        return temp
      end
      # Otherwise repeat the loop to check the next index with a max number
      # of checks equal to the length of the array to ensure all slots are checked
      count += 1
    end
    # If no open slot is round in array, count will eventually equal the length
    # of the array and end the loop.  The function will return -1 in this case.
    return -1
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
        tempIndex = index(i.key, tempItems.length)
        tempItems[tempIndex] = i
      end
    end
    @items = tempItems
  end

  def printList
    puts "Array size = " + size.to_s
    # puts "Load factor = " + load_factor.to_s
    @items.each_with_index do |i, index|
      puts "Array slot = " + index.to_s
      puts i
      if i != nil
        puts i.key
        puts i.value
      end
      puts ""
      puts ""
    end
    puts "********************"
  end
end
