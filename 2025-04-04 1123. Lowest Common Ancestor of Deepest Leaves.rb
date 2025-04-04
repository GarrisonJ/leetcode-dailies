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
# @return {TreeNode}
def lca_deepest_leaves(root)
    @deepest = -1
    @commen_ans = nil
    dfs(root, 0)
    @commen_ans
end

def dfs(node, curr)
    return curr if node.nil?
    dr = dfs(node.right, curr+1)
    dl = dfs(node.left, curr+1)

    if dr == dl
        if @deepest <= dr
            @commen_ans = node
            @deepest = dr
        end
        dr
    elsif dr < dl
        dl
    else
        dr
    end
end
