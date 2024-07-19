# @param {Integer[][]} matrix
# @return {Integer[]}
def lucky_numbers (matrix)
    maxes = matrix.transpose.map { |col| col.max }
    mins = matrix.map { |row| row.min }
    maxes & mins
end
