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

    # Checks if there is already a Hash object at the calculated index
    # If the array is not empty at that index and the value is different
    # than value to be inserted, a collision has occured and the array must be resized
    if @items[newIndex] != nil && @items[newIndex].value != value
      resize
      # Re-calculate the index for the item to be inserted based upon the new array size
      newIndex = index(key, @items.length)
    # If the array is not empty and the values are the same, or the array is empty
    # at that location, insert the value into the array
    # else
    end
    # Insert the Hash object into the array
    @items[newIndex] = newItem
    #is this right?  what happens if there is a collision even after the resize?
    puts "Array size = " + size.to_s
    @items.each do |i|
      if i != nil
        puts i.key
        puts i.value
      end
    end
  end

  def [](key)
    tempIndex = index(key, @items.length)
    return @items[tempIndex].value
  end

  def resize
    tempItems = Array.new(2 * @items.length)
    # @items.length.times do
    #   @items.push(nil)
    # end
    for i in @items
      if i != nil
        tempIndex = index(i.key, tempItems.length)
        tempItems[tempIndex] = i
      end
    end
    @items = tempItems
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
