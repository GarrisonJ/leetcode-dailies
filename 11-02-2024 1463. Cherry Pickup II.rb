# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
    dp = Array.new(grid.size) do 
        Array.new(grid[0].size) do
            Array.new(grid[0].size, -Float::INFINITY)
        end
    end

    dp[0][0][-1] = grid[0][0] + grid[0][-1]

    (1..grid.size-1).each do |row|
        (0..grid[0].size-2).each do |r1|
            ((r1+1)..grid[0].size-1).each do |r2|
                p_s = grid[row][r1] + grid[row][r2]
                [-1,0,1].each do |r1_dir|
                    [-1,0,1].each do |r2_dir|
                        next if !(r1+r1_dir).between?(0, grid[0].size-1)
                        next if !(r2+r2_dir).between?(0, grid[0].size-1)
                        next if r1+r1_dir == r2+r2_dir
                        dp[row][r1][r2] = [dp[row][r1][r2], p_s + dp[row-1][r1+r1_dir][r2+r2_dir]].max
                    end
                end
            end
        end
    end
    max = -Float::INFINITY
    (0..grid[0].size-2).each do |r1|
        ((r1+1)..grid[0].size-1).each do |r2|
            max = [max, dp[-1][r1][r2]].max
        end
    end
    max
end
