# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
    i = 0
    while i < nums.size do
        if nums[i] < nums.size && nums[i] > 0 && nums[i]-1 != i
            nums[i], nums[nums[i]-1] = nums[nums[i]-1], nums[i]
            i+=1 if nums[i] ==  nums[nums[i]-1]
        else
            i+=1
        end
    end
    i = 0
    while i < nums.size do
        return i+1 if nums[i]-1 != i
        i+=1
    end
    return i+1
end

