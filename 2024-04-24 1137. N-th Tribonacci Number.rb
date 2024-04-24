# @param {Integer} n
# @return {Integer}
def tribonacci(n)
    @memo ||= {}
    @memo[n] ||= begin
        return 0 if n == 0
        return 1 if n == 1
        return 1 if n == 2
        tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
    end
end

# @param {Integer} n
# @return {Integer}
def tribonacci(n)
    return 0 if n == 0
    return 1 if n == 1
    return 1 if n == 2
    t0 = 0
    t1 = 1
    t2 = 1
    (n-2).times { t0, t1, t2 = t1, t2, t0 + t1 + t2 }
    t2
end
