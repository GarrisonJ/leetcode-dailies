# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
    return (0..(n-1)).to_a if n <= 2

    graph = Array.new(n) { Set.new }
    edges.each do |a, b|
        graph[a] << b
        graph[b] << a
    end

    leaves = []
    n.times { |i| leaves << i if graph[i].size == 1 }
    
    remaining = n
    while remaining > 2 do
        remaining -= leaves.size
        new_leaves = []

        while !leaves.empty? do
            leaf = leaves.pop
            neighbor = graph[leaf].first
            graph[leaf].clear
            graph[neighbor].delete(leaf)
            if graph[neighbor].size == 1
                new_leaves << neighbor
            end
        end
        leaves = new_leaves
    end
    leaves
end
