# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
    stack = []
    ans = Array.new(temperatures.size, 0)
    temperatures.each.with_index.each do |t, i|
        while stack.any? && temperatures[stack[-1]] < t
            i_solved = stack.pop
            ans[i_solved] = i - i_solved
        end
        stack.append(i)
    end
    ans
end
