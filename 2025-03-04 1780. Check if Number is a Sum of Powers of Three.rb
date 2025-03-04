# @param {Integer} n
# @return {Boolean}
def check_powers_of_three(n)
    backtrack(n, 0, p_3.take_while { |x| x <= n }, 0)
end

def backtrack(n, i, p_3, sum)
    return true if sum == n
    return false if sum > n
    return false if i >= p_3.size

    return true if backtrack(n, i+1, p_3, sum+p_3[i])
    return true if backtrack(n, i+1, p_3, sum)
    false
end

def p_3
    @p_3 ||= (0..14).map { |x| 3**x }
end
