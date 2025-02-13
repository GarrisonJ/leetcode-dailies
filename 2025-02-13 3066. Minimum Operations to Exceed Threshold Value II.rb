# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
    heap = MinHeap.new(nums)
    count = 0
    loop do 
        return count if heap.size < 2
        x = heap.pop
        y = heap.pop
        return count if x >= k
        heap << ([x, y].min * 2 + [x, y].max)
        count += 1
    end
end

class MinHeap
  def initialize(nums)
    @heap = nums.sort!
  end

  def inspect
    @heap.inspect
  end

  def size
    @heap.size
  end

  def empty?
    @heap.empty?
  end

  def <<(value)
    @heap << value
    heapify_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    min_value = @heap[0]
    if @heap.size == 1
        @heap = []
        return min_value
    end
    @heap[0] = @heap.pop
    heapify_down(0) unless @heap.empty?
    min_value
  end

  def min
    @heap[0]
  end

  private

  def heapify_up(index)
    parent_index = (index - 1) / 2
    return if index <= 0 || (@heap[parent_index] <=> @heap[index]) < 0

    @heap[parent_index], @heap[index] = @heap[index], @heap[parent_index]
    heapify_up(parent_index)
  end

  def heapify_down(index)
    child_index = 2 * index + 1
    return if child_index >= @heap.size

    right_child_index = child_index + 1
    if right_child_index < @heap.size && (@heap[child_index] <=> @heap[right_child_index]) >= 0
      child_index = right_child_index
    end

    return if (@heap[index] <=> @heap[child_index]) == -1

    @heap[index], @heap[child_index] = @heap[child_index], @heap[index]
    heapify_down(child_index)
  end
end
