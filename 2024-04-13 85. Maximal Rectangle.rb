# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
    dp = Array.new(matrix.size) { Array.new(matrix[0].size, 0) }

    matrix[0].size.times do |col|
        dp[0][col] = matrix[0][col].to_i
    end

    (1..matrix.size-1).each do |row|
        matrix[0].size.times do |col|
            if matrix[row][col] == "1"
                dp[row][col] = dp[row-1][col].to_i + 1
            end
        end
    end
    
    result = 0
    (0..matrix.size-1).each do |row|
        stack = []
        (0..matrix[0].size-1).each do |col|
            if dp[row][col] == 0
                stack = []
            else
                index = col
                while !stack.empty? && stack.last.first > dp[row][col] do
                    index = stack.pop.last
                end
                stack << [dp[row][col].to_i, index]
            end
            stack.each do |height, index|
                result = [result, height*((col-index)+1)].max
            end
        end
    end
    result
end
