# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def sum_of_distances_in_tree(n, edges)
    @graph = Hash.new { |h,k| h[k] = Array.new }
    @count = [1]*n
    @ans = [0]*n
    @n = n

    edges.each do |from, to|
        @graph[from] << to
        @graph[to] << from
    end

    dfs(0, nil)
    dfsb(0, nil)
    return @ans
end

def dfs(node, parent)
    @graph[node].each do |go|
        next if go == parent
        dfs(go, node)
        @count[node] += @count[go]
        @ans[node] += @ans[go] + @count[go]
    end
end

def dfsb(node, parent)
    @graph[node].each do |go|
        next if go == parent
        @ans[go] = @ans[node]  + (-@count[go]) + @n + (-@count[go])
        dfsb(go, node)

    end
end

