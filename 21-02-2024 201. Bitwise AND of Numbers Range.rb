# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
    diff = right - left
    ans = 0
    [left.bit_length, right.bit_length].min.times do |i|
        if left[i] == 1 && right[i] == 1 && diff <= (1 << i)
            ans ^= (1 << i)
        end
    end
    ans
end
