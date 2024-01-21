# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    @memo = {}
    solve(nums, 0)
end


def solve(nums, i)
    @memo[i] ||= begin
        return nums[i] if i == nums.size-1
        return 0 if i > nums.size-1
        [nums[i] + solve(nums, i+2), solve(nums, i+1)].max
    end
end
