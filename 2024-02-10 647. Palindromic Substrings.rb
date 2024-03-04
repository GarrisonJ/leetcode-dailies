# @param {String} s
# @return {Integer}
def count_substrings(s)
    dp = Array.new(s.size) { Array.new(s.size, false) }
    count = 0
    s.size.times do |i|
        dp[i][i] = true
        count+=1
    end
    (s.size-1).times do |i|
        dp[i][i+1] = true if s[i] == s[i+1]
        count+=1 if dp[i][i+1]
    end
    (3..s.size).each do |size|
        (0..s.size-size).each do |i|
            dp[i][i+size-1] = dp[i+1][i+size-2] && s[i] == s[i+size-1]
            count+=1 if  dp[i][i+size-1]
        end
    end
    count
end
