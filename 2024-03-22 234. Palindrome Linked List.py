# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        if not head or not head.next:
            return True

        slow = head
        fast = head.next
        new_head = None
        while fast and fast.next:
            before = slow
            slow = slow.next
            fast = fast.next.next

            before.next = new_head
            new_head = before
        
        if fast:
            before = slow
            slow = slow.next
            before.next = new_head
            new_head = before
            return self.same(new_head, slow)
        else:
            return self.same(new_head, slow.next)


    def same(self, head1, head2) -> bool:
        if not head1 and not head2:
            return True
        elif not head1 or not head2:
            return False
        elif head1.val != head2.val:
            return False
        else:
            return self.same(head1.next, head2.next)
        

