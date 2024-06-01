# @param {String} s
# @return {Integer}
def score_of_string(s)
    sum = 0
    (s.size-1).times do |i|
        sum += (s[i].ord - s[i+1].ord).abs
    end
    sum
end
