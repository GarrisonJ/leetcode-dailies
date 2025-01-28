# @param {Integer[][]} grid
# @return {Integer}
def find_max_fish(grid)
    num_fish = 0
    grid.size.times do |row|
        grid[0].size.times do |col|
            num_fish = [catch_fish(grid, row, col), num_fish].max
        end
    end
    num_fish
end

def catch_fish(grid, row, col)
    return 0 if !row.between?(0, grid.size-1) || !col.between?(0, grid[0].size-1)
    return 0 if grid[row][col] <= 0

    num_fish = grid[row][col]
    grid[row][col] = -1

    num_fish += catch_fish(grid, row, col-1)
    num_fish += catch_fish(grid, row-1, col)
    num_fish += catch_fish(grid, row, col+1)
    num_fish += catch_fish(grid, row+1, col)
    num_fish
end
