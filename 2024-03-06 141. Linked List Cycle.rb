# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    return false if head.nil? || head.next.nil?

    slow = head
    fast = head.next

    while !fast.nil? && !fast.next.nil? do
        return true if slow == fast
        slow = slow.next
        fast = fast.next.next
    end
    return false
end
