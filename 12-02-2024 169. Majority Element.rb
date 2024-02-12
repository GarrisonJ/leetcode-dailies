# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums) = nums.tally.to_a.map(&:reverse).sort[-1][-1]
