# @param {String} s
# @param {Integer} k
# @return {Integer}
def take_characters(s, k)
    return 0 if k == 0
    count = s.chars.tally(Hash.new(0))
    return -1 if [count['a'], count['b'], count['c']].any? { |count| count < k }
    
    count = Hash.new(0)

    left = -1

    right = s.size
    while count['a'] < k || count['b'] < k || count['c'] < k do
        right -= 1
        count[s[right]] += 1
    end

    min_take = (left+1) + (s.size - right)
    
    while left < s.size-1 do
        left += 1
        count[s[left]] += 1

        while right <= s.size-1 && count[s[right]] != k do
            count[s[right]] -= 1
            right += 1
        end
        min_take = [min_take, (left+1) + (s.size - right)].min
    end

    min_take
end
