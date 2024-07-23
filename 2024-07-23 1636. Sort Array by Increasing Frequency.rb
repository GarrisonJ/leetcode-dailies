# @param {Integer[]} nums
# @return {Integer[]}
def frequency_sort(nums)
    counter = nums.tally
    nums.sort_by { |n| [counter[n], -n] }
end
