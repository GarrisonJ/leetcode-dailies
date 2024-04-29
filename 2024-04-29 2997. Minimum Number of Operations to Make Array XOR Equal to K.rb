# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
    (nums.reduce(:^) ^ k).to_s(2).count("1")
end
