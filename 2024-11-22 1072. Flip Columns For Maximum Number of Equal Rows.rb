# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(matrix)
    pattern_freq = Hash.new(0)
    matrix.each do |row|
        pattern_freq[row.map { |x| x == row[0]}]+=1
    end
    pattern_freq.values.max
end
