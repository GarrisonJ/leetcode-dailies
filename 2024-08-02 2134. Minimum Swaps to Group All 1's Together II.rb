# @param {Integer[]} nums
# @return {Integer}
def min_swaps(nums)
    ones = nums.count(1)
    i = 0
    j = 0

    count = nums[0]
    while j < ones-1 do
        j+=1
        count += nums[j]
    end

    min_swaps = ones-count

    while i <= nums.size-1 do
        count -= nums[i]
        i+=1
        j+=1
        count += nums[j % nums.size]
        min_swaps = [min_swaps, ones-count].min
    end
    min_swaps
end
