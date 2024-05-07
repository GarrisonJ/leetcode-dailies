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
def double_it(head)
    list = []

    ptr = head
    while !ptr.nil? do
        list << ptr
        ptr = ptr.next
    end

    carry = 0
    list.reverse.each do |node|
        new_carry = (node.val*2 + carry) / 10
        node.val = (node.val*2 + carry) % 10
        carry = new_carry
    end

    if carry != 0
        head = ListNode.new(carry, head)
    end
    head

end
