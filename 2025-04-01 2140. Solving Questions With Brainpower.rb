# @param {Integer[][]} questions
# @return {Integer}
def most_points(questions)
    @dp = Array.new(questions.size, 0)
    
    (questions.size-1).downto(0).each do |i|
        @dp[i] = questions[i][0]
        @dp[i] += @dp[i + 1 + questions[i][1]] if !@dp[i + 1 + questions[i][1]].nil?
        @dp[i] = [@dp[i], @dp[i+1]].max if !@dp[i+1].nil?
    end
    @dp[0]
end

