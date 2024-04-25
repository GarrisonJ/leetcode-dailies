# @param {String} s
# @param {Integer} k
# @return {Integer}
def longest_ideal_string(s, k)
    dp = [0]*26
    (0..s.size-1).each do |i|
        curr = s[i].ord - 'a'.ord
        best = 0
        26.times do |j|
            next if (j - curr).abs > k
            best = [best, dp[j]].max
        end
        dp[curr] = [dp[curr], best+1].max
    end
    dp.max
end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def longest_ideal_string(s, k)
    dp = [0]*26
    (0..s.size-1).each do |i|
        curr = s[i].ord - 'a'.ord
        lower_bound = [0, curr-k].max
        upper_bound = [curr+k, 26].min
        dp[curr] = dp[[0, curr-k].max..[curr+k, 26].min].max + 1
    end
    dp.max
end
