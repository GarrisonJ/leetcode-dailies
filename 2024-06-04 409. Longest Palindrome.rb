# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    length = 0
    counter = s.chars.tally
    odd = false
    counter.each do |_, count|
        length += (count / 2)*2
        odd = true if count.odd?
    end
    length += 1 if odd
    length
end
