# @param {Integer[]} nums
# @return {Integer}
def longest_monotonic_subarray(nums)
    longest_increasing = 0
    longest_decreasing = 0
    curr_inc = 0
    curr_dec = 0

    (nums.size-1).times do |i|
        if nums[i] < nums[i+1]
            curr_inc += 1
            curr_dec = 0
        elsif nums[i] > nums[i+1]
            curr_dec += 1
            curr_inc = 0
        else
            curr_dec = 0
            curr_inc = 0
        end
        longest_increasing = [longest_increasing, curr_inc].max
        longest_decreasing = [longest_decreasing, curr_dec].max
    end
    [longest_increasing, longest_decreasing].max + 1
end
