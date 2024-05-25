# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
    max_len = word_dict.map { |x| x.size }.max
    word_dict = Set.new(word_dict)
    solve(s, 0, word_dict, max_len)
end

def solve(s, i, word_dict, max_len)
    return [""] if i > s.size-1 
    result = Set.new
    (i..i+max_len).each do |j|
        if word_dict.include?(s[i..j])
            ans = solve(s, j+1, word_dict, max_len)
            ans.map! { |a| "#{s[i..j]} #{a}".strip }
            result.merge(ans)
        end
    end
    result.to_a
end
