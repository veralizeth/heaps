require_relative "../lib/min_heap"

# This method uses a heap to sort an array.
# Time Complexity: O(n)
# Space Complexity: O(1) 
def heap_sort(list)

return [] if list == []
return list if list.length == 1

  heap = MinHeap.new
  list.each do |node|
    heap.add(node, node)
  end 

  sorted_heap = []

  (0...list.length).each do |i|
    sorted_heap << heap.remove
  end
  return sorted_heap
end