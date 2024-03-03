# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    front = head
    back = head

    n.times { front = front.next }

    if front.nil?
        return head.next
    end

    while !front.next.nil? do
        front = front.next
        back = back.next
    end

    back.next = back.next.next
    head
end
