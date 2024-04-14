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
def sum_of_left_leaves(root)
    sum_of_left_leaves_rec(root, false)
end

def sum_of_left_leaves_rec(root, left)
    return 0 if root.nil?
    if left && root.left.nil? && root.right.nil?
        return root.val
    else
        sum_of_left_leaves_rec(root.left, true) + sum_of_left_leaves_rec(root.right, false)
    end
end
