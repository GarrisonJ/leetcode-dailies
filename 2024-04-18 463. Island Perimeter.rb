# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    perimeter = 0
    grid.size.times do |row|
        grid[0].size.times do |col|
            if grid[row][col] == 1
                if row == 0 || grid[row-1][col] != 1
                    perimeter+=1
                end
                if row == grid.size-1 || grid[row+1][col] != 1
                    perimeter+=1
                end

                if col == 0 || grid[row][col-1] != 1
                    perimeter+=1
                end
                if col == grid[0].size-1 || grid[row][col+1] != 1
                    perimeter+=1
                end
            end
        end
    end
    perimeter
end
