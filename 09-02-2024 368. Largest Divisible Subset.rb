def largest_divisible_subset(nums)
    nums.sort!

    dp = Array.new(nums.size) { Array.new }
    dp[0] = [nums[0]]

    (1..nums.size-1).each do |i|
        take = i
        (0..i-1).each do |j|
            if nums[i] % dp[j][-1] == 0 && dp[j].size > dp[take].size
                take = j
            end
        end
        dp[i] = dp[take] + [nums[i]]
    end

    dp.max_by(&:size)
end
