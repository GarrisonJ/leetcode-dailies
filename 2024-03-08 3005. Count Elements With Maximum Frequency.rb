# @param {Integer[]} nums
# @return {Integer}
def max_frequency_elements(nums)
    counts = nums.tally
    max_freq = 0
    ans = 0
    counts.each do |_, count|
        if count > max_freq
            ans = count
            max_freq = count
        elsif count == max_freq
            ans += count
        end
    end
    ans
end
