# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Integer}
def num_submatrix_sum_target(matrix, target)
    rows = matrix.size
    cols = matrix[0].size
    prefix_sum = Array.new(rows+1) { Array.new(cols+1, 0) }
    (0..rows-1).each do |row|
        (0..cols-1).each do |col|
            prefix_sum[row+1][col+1] += 
                ((prefix_sum[row][col+1] + prefix_sum[row+1][col]) - 
                prefix_sum[row][col]) + 
                matrix[row][col]
        end
    end

    ans = 0
    (0..rows-1).each do |r1|
        (r1..rows-1).each do |r2|
            sum_map = Hash.new(0)
            sum_map[0] = 1
            (0..cols-1).each do |c|
                sum = prefix_sum[r2+1][c+1] - prefix_sum[r1][c+1]
                ans += sum_map[sum-target]
                sum_map[sum]+=1
            end
        end
    end
    ans

end
