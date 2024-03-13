# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def remove_zero_sum_sublists(head)

    sentinal = ListNode.new(0, head)
    ptr = sentinal
    while ptr.next do 
        deleted = false
        sum = ptr.next.val
        runner = ptr.next
        while runner do
            if sum == 0
                deleted = true
                break
            end
            runner = runner.next
            sum += runner.val if runner
        end
        if deleted
            ptr.next = runner.next
            next 
        end

        ptr = ptr.next
    end
    sentinal.next
end
