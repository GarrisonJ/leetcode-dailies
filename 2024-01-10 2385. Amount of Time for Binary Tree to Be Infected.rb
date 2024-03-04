def amount_of_time(root, start)
    @adj_list = Hash.new { |h,k| h[k] = Set.new }
    @seen = Set.new()
    convert(root, nil)
    dfs(start)
end

def dfs(node)
    if @seen.include?(node)
        return -1
    else
        @seen.add(node)
        m = 0
        @adj_list[node].each do |neigh|
            m = [m, dfs(neigh) + 1].max
        end
        return m
    end
end

def convert(root, parent)
    return if !root
    @adj_list[root.val].add(root.left.val) if root.left
    @adj_list[root.val].add(root.right.val) if root.right
    @adj_list[root.val].add(parent.val) if parent
    convert(root.left, root)
    convert(root.right, root)
end
