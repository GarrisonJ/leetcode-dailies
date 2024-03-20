# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeInBetween(self, list1: ListNode, a: int, b: int, list2: ListNode) -> ListNode:
        list2_last = list2
        while list2_last.next:
            list2_last = list2_last.next
        
        front = list1
        for _ in range(a-1):
            front = front.next

        last_removed = front
        for _ in range((b-a)+2):
            last_removed = last_removed.next

        front.next = list2
        list2_last.next = last_removed

        return list1
