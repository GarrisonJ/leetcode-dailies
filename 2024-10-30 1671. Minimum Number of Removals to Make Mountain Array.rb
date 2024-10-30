# @param {Integer[]} nums
# @return {Integer}
def minimum_mountain_removals(nums)
  dp = Array.new(nums.size, 0)
  nums.each_with_index do |num, index|
    (index - 1).downto(0).each do |i|
      dp[index] = [dp[index], dp[i] + 1].max if nums[i] < num
    end
  end

  dp_backwards = Array.new(nums.size, 0)
  (nums.size - 1).downto(0) do |index|
    num = nums[index]
    ((index + 1)..nums.size - 1).each do |i|
      dp_backwards[index] = [dp_backwards[index], dp_backwards[i] + 1].max if nums[i] < num
    end
  end

  max_mountain = 0
  (1..nums.size - 2).each do |i|
    max_mountain = [max_mountain, dp[i] + dp_backwards[i] + 1].max if dp[i] != 0 && dp_backwards[i] != 0
  end
  nums.size - max_mountain
end
