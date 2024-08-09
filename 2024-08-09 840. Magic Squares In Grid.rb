# @param {Integer[][]} grid
# @return {Integer}
def num_magic_squares_inside(grid)
    return 0 if grid.size < 3 || grid[0].size < 3

    count = 0
    (0..grid.size-3).each do |i|
        (0..grid[0].size-3).each do |j|
            
            diag1 = grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2]
            diag2 = grid[i+2][j] + grid[i+1][j+1] + grid[i][j+2]
            row1 = grid[i][j..(j+2)].sum
            row2 = grid[i+1][j..(j+2)].sum
            row3 = grid[i+2][j..(j+2)].sum

            col1 = grid[i..(i+2)].map { |row| row[j] }.sum
            col2 = grid[i..(i+2)].map { |row| row[j+1] }.sum
            col3 = grid[i..(i+2)].map { |row| row[j+2] }.sum
            
            if [diag1, diag2, row1, row2, row3, col1, col2, col3].uniq.size == 1 &&
                ([grid[i][j..(j+2)], grid[i+1][j..(j+2)], grid[i+2][j..(j+2)]].flatten.sort == [1,2,3,4,5,6,7,8,9])
                    count += 1
            end

        end
    end
    count
end
