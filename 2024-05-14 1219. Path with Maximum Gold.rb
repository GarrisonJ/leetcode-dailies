# @param {Integer[][]} grid
# @return {Integer}
def get_maximum_gold(grid)
    max_gold = 0
    max_possible = grid.flatten.sum

    grid.size.times do |i|
        grid[0].size.times do |j|
            max_gold = [max_gold, solve(grid, i, j)].max
            return max_possible if max_gold == max_possible
        end
    end
    max_gold
end


def solve(grid, i, j)
    return 0 if !i.between?(0, grid.size-1)
    return 0 if !j.between?(0, grid[0].size-1)
    return 0 if grid[i][j] == 0

    value = grid[i][j]
    grid[i][j] = 0
    max_gold = 0
    max_gold = [max_gold, solve(grid, i+1, j)].max
    max_gold = [max_gold, solve(grid, i-1, j)].max
    max_gold = [max_gold, solve(grid, i, j+1)].max
    max_gold = [max_gold, solve(grid, i, j-1)].max
    grid[i][j] = value
    value + max_gold
end
