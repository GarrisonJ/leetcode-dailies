M = 1000000007
def k_inverse_pairs(n, k)
    dp = Array.new(k+1, 0)
    
    (1..n).each do |i|
        temp = Array.new(k+1, 0)
        temp[0] = 1
        (1..k).each do |j|
            val = (dp[j] + M - ((j - i) >= 0 ? dp[j - i] : 0)) % M;
            temp[j] = (temp[j - 1] + val) % M;
        end
        dp = temp;
    end

    ((dp[k] + M - (k > 0 ? dp[k - 1] : 0)) % M);
end
