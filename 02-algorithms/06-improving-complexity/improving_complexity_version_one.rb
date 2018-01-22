# This method takes n arrays as input and combine them in sorted ascending order
# Includes code optimizations
def poorly_written_ruby(*arrays)
  combined_array = []
  # Iterates through each item in each array and copies into combined_array
  # O(n^2)
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  # Initializes sorted_array with the last item in combined_array
  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  # O(n^2)
  for val in combined_array
    temp = sorted_array.length
    i = 0
    while i < temp
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == temp - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
