# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    return false if n <= 0
    (Math.log2(n)).to_i == Math.log2(n)
end
