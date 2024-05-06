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
def remove_nodes(head)
    nodes = []
    ptr = head

    while !ptr.nil? do
        nodes << ptr
        ptr = ptr.next
    end

    max_value = nil
    nodes.reverse.each do |ptr|
        max_value = ptr.val if max_value.nil?

        if ptr.val < max_value
            ptr.val = ptr.next.val
            ptr.next = ptr.next.next
        else
            max_value = [max_value, ptr.val].max
        end
    end
    head
end



