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
# @return {Boolean}
def is_even_odd_tree(root)
    queue = [root]
    level = -1
    while !queue.empty? do 
        size = queue.size
        level += 1

        if level.even?
            return false if queue.first.val.even?
            (1..queue.size-1).each do |i|
                return false if queue[i].val.even?
                return false if queue[i].val <= queue[i-1].val
            end
        else
            return false if queue.first.val.odd?
            (1..queue.size-1).each do |i|
                return false if queue[i].val.odd?
                return false if queue[i].val >= queue[i-1].val
            end
        end

        size.times do |_|
            node = queue.shift
            queue << node.left if node.left
            queue << node.right if node.right
        end
    end
    true
end
