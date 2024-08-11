# @param {String[]} grid
# @return {Integer}
def regions_by_slashes(grid)
    grid = grid.map(&:chars)
    new_grid = Array.new(grid.size*3) { Array.new(grid.size*3,' ')}

    grid.size.times do |i|
        grid[0].size.times do |j|
            new_i = i*3
            new_j = j*3
            if grid[i][j] == "/"
                new_grid[new_i][new_j+2] = "#"
                new_grid[new_i+1][new_j+1] = "#"
                new_grid[new_i+2][new_j] = "#"
            elsif grid[i][j] == "\\"
                new_grid[new_i][new_j] = "#"
                new_grid[new_i+1][new_j+1] = "#"
                new_grid[new_i+2][new_j+2] = "#"
            end
        end
    end
    grid = new_grid
    
    regions = 0
    grid.size.times do |i|
        grid[0].size.times do |j|
            if grid[i][j] == ' '
                mark(grid, i, j)
                regions += 1
            end
        end
    end
    regions
end

def mark(grid, i, j)
    return if !i.between?(0, grid.size-1) || !j.between?(0, grid[0].size-1)
    return if grid[i][j] != ' '
    grid[i][j] = "#"

    mark(grid, i+1, j)
    mark(grid, i-1, j)
    mark(grid, i, j+1)
    mark(grid, i, j-1)
end
