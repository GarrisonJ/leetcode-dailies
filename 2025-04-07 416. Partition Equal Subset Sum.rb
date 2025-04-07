# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
    total = 0
    max = -Float::INFINITY

    nums.each do |n|
        total += n
        max = [max, n].max
    end
    return false if total.odd?
    return false if max > total/2

    dp = Array.new(total / 2 + 1, false)
    dp[nums[-1]] = true
    dp[0] = true

    (nums.size-2).downto(0).each do |i|
        dp_new = dp.dup
        dp.each_with_index do |can_make, k|
            dp_new[k + nums[i]] = true if can_make && ((k + nums[i]) <= dp.size-1)
        end
        dp = dp_new
    end
    dp[total/2]
end
