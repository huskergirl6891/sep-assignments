# Swaps two items in an array, changing the original array
def swap(array, firstIndex, secondIndex)
  temp = array[firstIndex]
  array[firstIndex] = array[secondIndex]
  array[secondIndex] = temp
end

# Partition the given array and return the index
def partition(array, p, r)
  q = p
  for j in p..r-1
    if array[j] <= array[r]
      swap(array, j, q)
      q = q + 1
    end
  end
  swap(array, r, q)
  return q
end

# array = [9, 7, 5, 11, 12, 2, 14, 3, 10, 4, 6]
# partition(array, 0, array.length-1)
# puts "Array after partitioning: "
# print "["
# for i in array
#   if i == array[-1]
#     print i.to_s + "]"
#   else
#     print i.to_s + ", "
#   end
# end
# puts ""
# puts "*************"

def quickSort(array, k, r)
  if k < r
    pivot = partition(array, k, r)
    quickSort(array, k, pivot - 1)
    quickSort(array, pivot + 1, r)
  end
end

# array2 = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
# quickSort(array2, 0, array2.length-1)
# puts "Array after sorting: "
# print "["
# for i in array2
#   if i == array2[-1]
#     print i.to_s + "]"
#   else
#     print i.to_s + ", "
#   end
# end
# puts ""
# puts "*************"
#
# array3 = [25, 3, 55, -21, 0, 6]
# quickSort(array3, 0, array3.length-1)
# puts "Array after sorting: "
# print "["
# for i in array3
#   if i == array3[-1]
#     print i.to_s + "]"
#   else
#     print i.to_s + ", "
#   end
# end
