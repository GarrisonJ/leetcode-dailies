# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def max_sum_after_partitioning(arr, k)
    dp = Array.new(arr.size+1, 0)
    dp[0] = 0
    dp[1] = arr[0]
    (1..arr.size-1).each do |i|
        (1..k).each do |sub_size|
            max_value = arr[(i-sub_size+1)..i].max
            break if max_value.nil?
            dp[i+1] = [dp[i+1], (max_value * sub_size) + dp[i+1-sub_size]].max
        end
    end
    dp[-1]
end
