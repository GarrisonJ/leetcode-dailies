# @param {Integer[][]} grid
# @return {Integer}
def min_falling_path_sum(grid)
    (1..grid.size-1).each do |row|
        grid[row][0] += grid[row-1][1..].min
        grid[row][-1] += grid[row-1][..-2].min
        (1..grid[0].size-2).each do |col|
            left = grid[row-1][..col-1].min
            right = grid[row-1][col+1..].min
            grid[row][col] += [left, right].min
        end
    end
    grid[-1].min
end
