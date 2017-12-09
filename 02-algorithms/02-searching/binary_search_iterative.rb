def binary_search_iter(collection, value)
  # arguments:
  # collection - array of values to be checked
  # value - target value to be found

  # initial index values for beginning and end of collection array
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return "not found"
end

test_collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts binary_search_iter(test_collection, 8)
puts binary_search_iter(test_collection, 3)
puts binary_search_iter(test_collection, 11)
