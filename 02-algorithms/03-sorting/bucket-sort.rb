require_relative 'insertion-sort'

# Sort array "arr" of size n
def bucketSort(arr, n)
  # Create n empty buckets
  buckets = Array.new(n)

  # Put elements of array into buckets
  for i in 0..n-1
    bucket_index = (n * arr[i]).to_i
    if buckets[bucket_index] == nil
      buckets[bucket_index] = Array.new(1,arr[i])
    else
      buckets[bucket_index].insert(-1, arr[i])
    end
  end

  # Sort each bucket
  for i in 0..n-1
    if buckets[i] != nil
      buckets[i] = insertion_sort(buckets[i])
    end
  end

  # Concat all buckets
  index = 0
  for i in 0..n-1
    if buckets[i] != nil
      for j in 0..(buckets[i].length - 1)
        arr[index] = buckets[i][j]
        index += 1
      end
    end
  end
end

arr = [0.897, 0.656, 0.565, 0.1234, 0.665, 0.3434]
n = arr.length
bucketSort(arr, n)
puts "n = "
puts n
puts "Sorted array is \n"
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
