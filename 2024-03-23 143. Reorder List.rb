# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
    slow = head
    fast = head.next
    count = 1

    while fast && fast.next do
        count+=1
        slow = slow.next
        fast = fast.next.next
    end
    if fast
        slow = slow.next
    end

    first = head
    second = reverse(slow)

    while second.next do
        first.next, first = second, first.next
        second.next, second = first, second.next
    end
end

def reverse(head)
    if head.nil? || head.next.nil?
        head
    else
        new_list = reverse(head.next)
        head.next.next = head
        head.next = nil
        new_list
    end
end
