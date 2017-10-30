class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # Creates a new HashItem object to store the key and value for insertion
    newItem = HashItem.new(key, value)

    # Calculates the index based upon the key and current length of the @items array
    newIndex = index(key, @items.length)

    # Insertion into the array

    # Checks if there is already an entry at the calculated index
    # If the array is not empty at that index and the value is different
    # than value to be inserted, a collision has occured and the array must be resized
    if @items[newIndex][1] != nil && @items[newIndex][1] != value
      resize

    # If the array is not empty and the values are the same, or the array is empty
    # at that location, insert the value into the array
    else
      @items[newIndex][0] = key
      @items[newIndex][1] = value
    end
  end

  def [](key)

  end

  def resize
    newItems = Array.new(@items.length*2)
    # @items.length.times do
    #   @items.push(nil)
    # end
    for i in @items
      tempIndex = index(i[0], newItems.length)
      newItems[tempIndex][0] = i[0]
      newItems[tempIndex][1] = i[1]
    end
    return newItems
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    indexAscii = key.sum
    indexValue = indexAscii % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
