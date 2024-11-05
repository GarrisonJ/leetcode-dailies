# @param {String} s
# @return {Integer}
def min_changes(s)
    counts = []
    count = 1
    digit = s[0]
    (1..s.size-1).each do |i|
        if digit == s[i]
            count+=1
        else
            counts << count
            digit = s[i]
            count = 1
        end
    end
    counts << count
    odd_indexes = []
    counts.each_with_index do |x, index|
        odd_indexes << index if x.odd?
    end
    ans = 0
    (0..odd_indexes.size-1).step(2).each do |i|
        ans += odd_indexes[i+1] - odd_indexes[i]
    end
    ans
end
