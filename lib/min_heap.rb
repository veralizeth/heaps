class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn)
  # Space Complexity: o(n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    swap(0, @store.length - 1)
    element = @store.pop
    heap_down(0)
    element.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: o(1)
  # Space complexity: o(1)
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn
  # Space complexity: o(n)
  def heap_up(index)
    parent_i = parent(index)
    # return if we reach the root element or if the parent is already greater than the child
    if index >= 1 and @store[parent_i].key > @store[index].key
      # we exchange the child with the parent
      swap(index, parent_i)
      # and keep bubbling up
      heap_up(parent_i)
    end
  end

  def parent(i)
    ((i - 1) / 2).floor
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_i = left(index)
    right_i = right(index)

    # If one of the nodes is greater than the lenght of the array return.
    return if left_i > @store.length || right_i > @store.length

    if @store[index].key > @store[left_i].key and @store[index].key > @store[right_i].key
      min_index = @store[left_i].key < @store[right_i].key ? left_i : right_i
      swap(index, min_index)
      heap_down(min_index)
    end
  end

  def left(i)
    i * 2 + 1
  end

  def right(i)
    i * 2 + 2
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    @store[index_1], @store[index_2] = @store[index_2], @store[index_1]
  end
end
