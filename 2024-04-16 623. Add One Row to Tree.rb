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
# @param {Integer} val
# @param {Integer} depth
# @return {TreeNode}
def add_one_row(root, val, depth)
    add_one_row_rec(root, val, depth, true)
end

def add_one_row_rec(root, val, depth, left)
    if depth == 1
        if left 
            return TreeNode.new(val, root, nil)
        else
            return TreeNode.new(val, nil, root)
        end
    end
    return root if root.nil?

    l = add_one_row_rec(root.left, val, depth-1, true)
    r = add_one_row_rec(root.right, val, depth-1, false)
    root.left = l
    root.right = r
    root
end
