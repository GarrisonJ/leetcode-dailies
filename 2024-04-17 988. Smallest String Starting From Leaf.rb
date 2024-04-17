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
# @return {String}
def smallest_from_leaf(root)
    @result = [26]
    smallest_from_leaf_rec(root, [])
    @result.map { |x|  ('a'.ord + x).chr  }.join
end

def smallest_from_leaf_rec(root, curr)
    return if root.nil?
    curr.prepend(root.val)
    if root.left.nil? && root.right.nil?
        @result = [@result, curr.dup].min
    end
    smallest_from_leaf_rec(root.left, curr)
    smallest_from_leaf_rec(root.right, curr)
    curr.shift
end

