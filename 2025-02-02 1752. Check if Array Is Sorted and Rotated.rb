# @param {Integer[]} nums
# @return {Boolean}
def check(nums)
    drops = false
    (nums.size-1).times do |i|
        if nums[i] > nums[i+1]
            return false if drops
            drops = true
        end
    end
    return false if drops && nums[0] < nums[-1]
    true
end
