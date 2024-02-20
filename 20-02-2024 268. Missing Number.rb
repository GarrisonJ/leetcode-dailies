# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    sorted = Array.new(nums.size+1, false)
    nums.each do |num|
        sorted[num] = true
    end
    sorted.index(false)
end

# Or using guass's formula for O(1) space
def missing_number(nums) = (nums.size*(nums.size+1))/2 - nums.sum
