# Swaps two items in an array, changing the original array
def swap(array, firstIndex, secondIndex)
  temp = array[firstIndex]
  array[firstIndex] = array[secondIndex]
  array[secondIndex] = temp
end

# Create a heap of subtree with root at index i
# n is the size of the heap
def heapify(arr, n, i)
  largest = i # Initialize largest as root
  l = 2 * i + 1 # index of left child
  r = 2 * i + 2 # index of right child

  # Check if left child of root exists and is greater than root
  if l < n && arr[i] < arr[l]
    largest = l
  end

  # Check if right child of root exists and is greater than root
  if r < n && arr[largest] < arr[r]
    largest = r
  end

  # Change root if needed
  if largest != i
    swap(arr, i, largest) # swap
    heapify(arr, n, largest)
  end
end

def heapSort(arr)
  n = arr.length

  # Build heap
  for i in (n).downto(0)
    heapify(arr, n, i)
  end

  # Extract elements
  for i in (n-1).downto(0)
    swap(arr, i, 0)
    heapify(arr, i, 0)
  end
end

arr = [ 12, 11, 13, 5, 6, 7]
heapSort(arr)
n = arr.length
puts "Sorted array is:"
print "["
for i in arr
  if i == arr[-1]
    print i.to_s + "]"
  else
    print i.to_s + ", "
  end
end
puts ""
puts "*************"

array2 = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
heapSort(array2)
n = array2.length
puts "Array after sorting: "
print "["
for i in array2
  if i == array2[-1]
    print i.to_s + "]"
  else
    print i.to_s + ", "
  end
end
puts ""
puts "*************"

array3 = [25, 3, 55, -21, 0, 6]
heapSort(array3)
n = array3.length
puts "Array after sorting: "
print "["
for i in array3
  if i == array3[-1]
    print i.to_s + "]"
  else
    print i.to_s + ", "
  end
end
