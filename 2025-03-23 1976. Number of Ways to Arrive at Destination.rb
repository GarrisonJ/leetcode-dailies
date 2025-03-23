# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def count_paths(n, roads)
    @map = Hash.new { |h,k| h[k] = [] }
    roads.each do |a,b,time|
        @map[a] << [b,time]
        @map[b] << [a,time]
    end

    queue = MinHeap.new
    queue.push([0,0])
    count = Array.new(n, 0)
    count[0] = 1
    dist = Array.new(n, Float::INFINITY)
    dist[0] = 0
    while !queue.empty? do
        node, node_time = queue.pop
        next if node_time > dist[node]
        @map[node].each do |next_node, time|
            if time + node_time < dist[next_node]
                dist[next_node] = time + node_time
                count[next_node] = count[node]
                queue.push([next_node, dist[next_node]]) 
            elsif time + node_time == dist[next_node]
                count[next_node] = (count[node] + count[next_node]) % (10**9 + 7)
            end
        end
    end
    count[n-1] 
end


class MinHeap
    def initialize
        @queue = []
    end

    def empty?
        @queue.empty?
    end

    def push(node)
        i = @queue.bsearch_index { |x| x[1] >= node[1] } || @queue.size
        @queue.insert(i, node)
    end

    def pop
        @queue.shift
    end
end

