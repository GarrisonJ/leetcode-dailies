# @param {Integer} low
# @param {Integer} high
# @return {Integer[]}
def sequential_digits(low, high)
    digits = "123456789"
    min_len = low.to_s.size
    max_len = high.to_s.size
    ans = []
    (min_len..max_len).each do |size|
        (digits.size-size+1).times do |i|
            d = digits[i..i+size-1].to_i
            if low <= d && d <= high
                ans << d
            end
        end
    end
    ans
end
