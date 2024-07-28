# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} time
# @param {Integer} change
# @return {Integer}
def second_minimum(n, edges, time, change)
    
    adj = Array.new(n+1) { Array.new }

    edges.each do |a, b|
        adj[a] << b
        adj[b] << a
    end

    dist1 = Array.new(n+1, Float::INFINITY)
    dist2 = Array.new(n+1, Float::INFINITY)
    dist1[1] = 0
    freq = Array.new(n+1, 0)

    queue = MinHeap.new
    queue << [0, 1]

    while queue.size > 0 do
        time_taken, node = queue.pop
        freq[node]+=1
        return time_taken if node == n && freq[n] == 2

        if (time_taken / change) % 2 == 1
            time_taken = change * (time_taken / change + 1) + time
        else
            time_taken = time_taken + time
        end

        adj[node].each do |neigh|

            next if freq[neigh] == 2
            if dist1[neigh] > time_taken
                dist2[neigh] = dist1[neigh]
                dist1[neigh] = time_taken
                queue << [time_taken, neigh]
            elsif dist2[neigh] > time_taken && dist1[neigh] != time_taken
                dist2[neigh] = time_taken
                queue << [time_taken, neigh]
            end
        end
    end
    0
end


class MinHeap
    def initialize
        @nodes = []
    end
    def <<(node)
        index = @nodes.bsearch_index { |time, _| node[0] <= time } || @nodes.size
        @nodes.insert(index, node)
    end
    def pop
        @nodes.shift
    end
    def size
        @nodes.size
    end
end
