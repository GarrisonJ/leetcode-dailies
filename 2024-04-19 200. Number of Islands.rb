# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    count = 0
    grid.size.times do |row|
        grid[0].size.times do |col|
            if grid[row][col] == "1"
                mark(grid, row, col) 
                count+=1
            end
        end
    end
    count
end

def mark(grid, row, col)
    return if !row.between?(0, grid.size-1) || !col.between?(0, grid[0].size-1)
    return if grid[row][col] != "1"
    grid[row][col] = "#"

    mark(grid,row-1,col)
    mark(grid,row+1,col)
    mark(grid,row,col-1)
    mark(grid,row,col+1)
end
