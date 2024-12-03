# @param {String} s
# @param {Integer[]} spaces
# @return {String}
def add_spaces(s, spaces)
    new_s = []
    spaces_index = 0
    s.size.times do |i|
        if !spaces.empty? && i == spaces[spaces_index] 
            new_s << ' '
            spaces_index += 1
        end
        new_s << s[i]
    end
    new_s.join
end
