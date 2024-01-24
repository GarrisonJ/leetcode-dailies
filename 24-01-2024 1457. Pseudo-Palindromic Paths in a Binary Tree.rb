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
# @return {Integer}
def pseudo_palindromic_paths(root)
    @count = 0
    nodes = Hash.new(0)
    solve(root, nodes)
    @count
end

def solve(root, nodes)
    if root.left.nil? && root.right.nil?
        nodes[root.val]+=1
        one_count = 0
        nodes.each do |_, c|
            one_count += 1 if c % 2 != 0
            break if one_count > 1
        end
        @count+=1 if one_count <= 1
        nodes[root.val]-=1
    else
        nodes[root.val] += 1
        solve(root.left, nodes) if root.left
        solve(root.right, nodes) if root.right
        nodes[root.val] -= 1
    end
end
