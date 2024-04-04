# @param {String} s
# @return {Integer}
def max_depth(s)
    max = 0
    bracket = 0
    s.chars.each do |c|
        bracket+=1 if c == "("
        bracket-=1 if c == ")"
        max = [max, bracket].max
    end
    max
end
