# @param {String} s
# @param {Integer} repeat_limit
# @return {String}
def repeat_limited_string(s, repeat_limit)
    chars = s.chars.sort.reverse
    left_behind = []
    result = []
    curr_count = 0
    changed = true
    while !chars.empty? || !left_behind.empty? do
        break if !changed
        changed = false
        while !left_behind.empty?
            if result.last != left_behind.first
                result << left_behind.shift
                curr_count = 1
                changed = true
            elsif curr_count < repeat_limit
                result << left_behind.shift
                curr_count += 1
                changed = true
            else
                break
            end
        end
        if !chars.empty?
            if chars.first != result.last
                result << chars.shift
                curr_count = 1
            elsif curr_count < repeat_limit
                result << chars.shift
                curr_count += 1
            else
                left_behind << chars.shift
            end
            changed = true
        end
    end

    result.join
end
