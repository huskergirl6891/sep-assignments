def binary_search_iter(collection, low, high, value)
  if high >= low
    mid = (low + (high - 1)) / 2
    if collection[mid] == value
      return mid
    elsif collection[mid] > value
      return binary_search_iter(collection, low, mid-1, value)
    else
      return binary_search_iter(collection, low+1, high, value)
    end
  else
    return "not found"
  end
end

test_collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts binary_search_iter(test_collection, 0, test_collection.length - 1, 8)
puts binary_search_iter(test_collection, 0, test_collection.length - 1, 3)
puts binary_search_iter(test_collection, 0, test_collection.length - 1, 11)
