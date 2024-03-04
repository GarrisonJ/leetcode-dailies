# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    return 1 if n == 1
    prev1 = 2
    prev2 = 1

    (n-3).downto(0).each do |_|
        prev1, prev2 = (prev1 + prev2), prev1
    end

    prev1
end
