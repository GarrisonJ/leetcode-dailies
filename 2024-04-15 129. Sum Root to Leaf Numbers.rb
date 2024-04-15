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
def sum_numbers(root)
    @sum = 0
    solve(root, 0)
    @sum
end

def solve(root, curr)
    return if root.nil?

    curr *= 10
    curr += root.val

    if root.left.nil? && root.right.nil?
        @sum += curr
    end
    solve(root.left, curr)
    solve(root.right, curr)
end
