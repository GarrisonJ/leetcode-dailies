# @param {Integer[]} nums
# @return {Integer}
def subset_xor_sum(nums)
    @sum = 0
    backtrack(nums, 0, 0)
    @sum
end

def backtrack(nums, i, curr)
    return @sum += curr if i == nums.size
    backtrack(nums, i+1, curr ^ nums[i])
    backtrack(nums, i+1, curr)
end
