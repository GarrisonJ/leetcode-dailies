# @param {Integer[][]} grid
# @return {Integer}
def maximum_safeness_factor(grid)
    n = grid.size
    return 0 if grid[0][0] == 1 || grid[n-1][n-1] == 1

    queue = []
    n.times do |i|
        n.times do |j|
            if grid[i][j] == 1 
                queue << [i,j]
                grid[i][j] = 0
            else
                grid[i][j] = -1
            end
        end
    end
    mark(queue, grid)

    pq = MaxHeap.new

    pq.push([grid[0][0], 0, 0])

    while !pq.empty? do
        safeness, i, j = pq.pop

        return safeness if i == n-1 && j == n-1

        DIRS.each do |d|
            di, dj = i + d[0], j + d[1]
            if di.between?(0, n-1) && dj.between?(0, n-1) && grid[di][dj] != -1
                pq.push([[safeness, grid[di][dj]].min, di, dj])
                grid[di][dj] = -1
            end
        end
    end
    -1
end

DIRS = [[0,1], [0,-1], [1,0], [-1,0]]

def mark(queue, grid)
    n = grid.size
    while !queue.empty? do
        size = queue.size
        size.times do |_|
            curr = queue.shift
            DIRS.each do |d|
                di, dj = curr[0] + d[0], curr[1] + d[1]
                if di.between?(0, n-1) && dj.between?(0, n-1) && grid[di][dj] == -1
                    grid[di][dj] = grid[curr[0]][curr[1]] + 1
                    queue << [di, dj]
                end
            end
        end
    end
end

class MaxHeap
  def initialize
    @heap = []
  end

  def empty?
    @heap.empty?
  end

  def push(value)
    @heap << value
    heapify_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    max_value = @heap[0]
    @heap[0] = @heap.pop
    heapify_down(0) unless @heap.empty?
    max_value
  end

  def max
    @heap[0]
  end

  private

  def heapify_up(index)
    parent_index = (index - 1) / 2
    return if index <= 0 || (@heap[parent_index] <=> @heap[index]) >= 0

    @heap[parent_index], @heap[index] = @heap[index], @heap[parent_index]
    heapify_up(parent_index)
  end

  def heapify_down(index)
    child_index = 2 * index + 1
    return if child_index >= @heap.size

    right_child_index = child_index + 1
    if right_child_index < @heap.size && (@heap[child_index] <=> @heap[right_child_index]) == -1
      child_index = right_child_index
    end

    return if (@heap[index] <=> @heap[child_index]) >= 0

    @heap[index], @heap[child_index] = @heap[child_index], @heap[index]
    heapify_down(child_index)
  end
end
