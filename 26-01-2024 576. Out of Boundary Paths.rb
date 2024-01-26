# @param {Integer} m
# @param {Integer} n
# @param {Integer} max_move
# @param {Integer} start_row
# @param {Integer} start_column
# @return {Integer}

MOD = 10**9 + 7
def find_paths(m, n, max_move, start_row, start_column)
    dp = Array.new(m) { Array.new(n) { Hash.new } }

    (0..m-1).each do |r|
        (0..n-1).each do |c|
            dp[r][c][1] = 0
            dp[r][c][0] = 0
        end
    end

    (0..n-1).each do |c|
        dp[0][c][1] += 1
        dp[m-1][c][1] += 1
    end
    (0..m-1).each do |r|
        dp[r][0][1] += 1
        dp[r][n-1][1] += 1
    end

    (2..max_move).each do |k|
        (0..m-1).each do |i|
            (0..n-1).each do |j|
                dp[i][j][k] = 0
                dp[i][j][k] += (i + 1 < m ? dp[i+1][j][k-1] : 1)
                dp[i][j][k] += (j + 1 < n ? dp[i][j+1][k-1] : 1)
                dp[i][j][k] += (i - 1 >= 0 ? dp[i-1][j][k-1] : 1)
                dp[i][j][k] += (j - 1 >= 0 ? dp[i][j-1][k-1] : 1)
            end
        end
    end    

    dp[start_row][start_column][max_move] % MOD
end
