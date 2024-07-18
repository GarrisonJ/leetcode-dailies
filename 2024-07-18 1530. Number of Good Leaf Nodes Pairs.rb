# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} distance
# @return {Integer}
def count_pairs(root, distance)
    @result = 0
    @graph = Hash.new { |h,k| h[k] = Array.new }
    @leaves = []
    build_graph(root)
    @leaves.each do |leaf|
        dfs(leaf, distance, Set.new([leaf]))
    end

    @result / 2
end


def dfs(node, d, seen)
    if d == 0
        return
    else
        @graph[node].each do |n|
            next if seen.include?(n)
            if @leaves.include?(n)
                @result+=1
            else
                seen.add(n)
                dfs(n, d-1, seen)
                seen.delete(n)
            end
        end
    end
end

def build_graph(node)
    return if !node
    if node.left
        @graph[node] << node.left 
        @graph[node.left] << node
    end
    if node.right
        @graph[node] << node.right 
        @graph[node.right] << node
    end
    if !node.left && !node.right
        @leaves << node
    end
    build_graph(node.left)
    build_graph(node.right)
end
