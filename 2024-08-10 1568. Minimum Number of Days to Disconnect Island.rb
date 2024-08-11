# @param {Integer[][]} grid
# @return {Integer}
def min_days(grid)

    islands = island_count(grid)
    return 0 if islands == Float::INFINITY || islands == 0

    grid.size.times do |i|
        grid[0].size.times do |j|
            if grid[i][j] == 1
                grid[i][j] = 0
                islands = island_count(grid)
                return 1 if islands == Float::INFINITY || islands == 0
                grid[i][j] = 1
            end
        end
    end
    2
end

def island_count(grid)
    islands = 0
    grid.size.times do |i|
        grid[0].size.times do |j|
            if grid[i][j] == 1
                islands+=1
                mark(grid,i,j)
            end
            if islands > 1
                reset(grid)
                return Float::INFINITY 
            end
        end
    end
    reset(grid)
    islands
end

def reset(grid)
    grid.size.times do |i|
        grid[0].size.times do |j|
            grid[i][j] = 1 if grid[i][j] == "#"
        end
    end
end

def mark(grid, i, j)
    return if !i.between?(0, grid.size-1) || !j.between?(0, grid[0].size-1)
    return if grid[i][j] != 1
    grid[i][j] = "#"

    mark(grid, i-1, j)
    mark(grid, i+1, j)
    mark(grid, i, j-1)
    mark(grid, i, j+1)
end
