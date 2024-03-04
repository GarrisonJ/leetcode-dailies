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
def diameter_of_binary_tree(root)
    res, _ = solve(root)
    res
end

def solve(root)
    return [0, 0] if !root

    left_res, left_len = solve(root.left)
    right_res, right_len = solve(root.right)

    this_res = left_len + right_len
    this_len = [left_len, right_len].max + 1

    [[this_res, left_res, right_res].max, this_len]
end
