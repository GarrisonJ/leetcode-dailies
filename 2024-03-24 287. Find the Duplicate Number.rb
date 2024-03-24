# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    slow = 0
    fast = nums[nums[slow]]
    while fast != slow do
        fast = nums[nums[fast]]
        slow = nums[slow]
    end
    slow = 0
    fast = nums[nums[fast]]
    while fast != slow do
        slow = nums[slow]
        fast = nums[fast]
    end
    slow
end
