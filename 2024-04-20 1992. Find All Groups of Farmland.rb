# @param {Integer[][]} land
# @return {Integer[][]}
def find_farmland(land)
    result = []
    land.size.times do |row|
        land[0].size.times do |col|
            if land[row][col] == 1
                @bottom_row = row 
                @bottom_col = col 
                mark(land, row, col)
                result << [row, col, @bottom_row, @bottom_col]
            end
        end
    end
    result
end

def mark(land, row, col)
    return if !row.between?(0, land.size-1) || !col.between?(0, land[0].size-1)
    return if land[row][col] != 1
    land[row][col] = 2

    if row >= @bottom_row && col >= @bottom_col
        @bottom_row = row
        @bottom_col = col
    end

    mark(land, row+1, col)
    mark(land, row-1, col)
    mark(land, row, col+1)
    mark(land, row, col-1)
end
