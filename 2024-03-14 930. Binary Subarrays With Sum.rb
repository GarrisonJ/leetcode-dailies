# @param {Integer[]} nums
# @param {Integer} goal
# @return {Integer}
def num_subarrays_with_sum(nums, goal)
    freq = Hash.new(0)
    sum = 0
    count = 0
    nums.each do |num|
        sum += num
        count += 1 if sum == goal
        count += freq[sum-goal]
        freq[sum] += 1
    end
    count
end
