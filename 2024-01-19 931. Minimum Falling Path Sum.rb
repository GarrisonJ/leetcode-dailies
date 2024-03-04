# @param {Integer[][]} matrix
# @return {Integer}
def min_falling_path_sum(matrix)
    (matrix.size-2).downto(0).each do |row|
        matrix.size.times do |col|
            paths = []
            paths << matrix[row+1][col]
            paths << matrix[row+1][col-1] if col-1 >= 0
            paths << matrix[row+1][col+1] if col+1 <= matrix.size-1
            matrix[row][col] += paths.min
        end
    end

    matrix[0].min
end
