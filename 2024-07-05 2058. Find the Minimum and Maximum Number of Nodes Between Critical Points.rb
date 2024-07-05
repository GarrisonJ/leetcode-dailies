# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer[]}
def nodes_between_critical_points(head)
    first = nil
    last = nil
    loc = 0
    prev = nil
    min_dist = Float::INFINITY
    while !head.nil? do
        if is_critial?(prev, head, head.next)
            first = loc if first.nil?
            min_dist = [min_dist, loc - last].min if !last.nil?
            last = loc
        end
        loc += 1
        prev = head
        head = head.next
    end

    max_dist = -1 
    max_dist = last - first if first != last
    min_dist = -1 if min_dist == Float::INFINITY
    return [min_dist, max_dist]
end

def is_critial?(prev, curr, nxt)
    return false if prev.nil? || nxt.nil?
    return true if prev.val < curr.val && nxt.val < curr.val
    return true if prev.val > curr.val && nxt.val > curr.val
    false
end
