require_relative 'quick-sort'
require_relative 'heap-sort'
require_relative 'bucket-sort'
require 'benchmark'

n = 50
sorted_array = []
for i in 1..n
  sorted_array.push(i)
end
puts "Sorted array"
print sorted_array
puts
temp = Random.new
unsorted_array = []
for i in sorted_array
  item = temp.rand(sorted_array.length)
  temp2 = sorted_array.delete_at(item)
  unsorted_array.push(temp2)
end
puts "Unsorted array = "
print unsorted_array
puts

n = unsorted_array.length

Benchmark.bm do |x|
  x.report("Quick Sort:") { quickSort(unsorted_array, 0, unsorted_array.length-1) }
  x.report("Heap Sort:") { heapSort(unsorted_array) }
  x.report("Bucket Sort:") { bucketSort(unsorted_array, n) }
end
