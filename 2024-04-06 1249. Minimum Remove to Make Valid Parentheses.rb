# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
    new_s = []
    left = 0
    right = 0
    s.chars.each_with_index do |c, i|
        left += 1 if c == '('
        right += 1 if c == ')'

        if c == ')' && left < right
            right -= 1
        else
            new_s << c
        end
    end
    left = 0
    right = 0
    s = new_s.reverse
    new_s = []
    s.each_with_index do |c, i|
        left += 1 if c == '('
        right += 1 if c == ')'

        if c == '(' && left > right
            left -= 1
        else
            new_s << c
        end
    end

    new_s.reverse.join
end
