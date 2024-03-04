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
def find_bottom_left_value(root)
    queue = [root]
    curr = nil
    while !queue.empty? do
        curr = queue.shift
        queue << curr.right if curr.right
        queue << curr.left if curr.left
    end
    curr.val
end
