# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)

    t_counter = Hash.new(0)
    t.chars.tally(t_counter)
    t_size = t.size

    counter = Hash.new(0)
    c_found = 0

    left = 0
    right = 0
    counter[s[0]]+=1
    c_found+=1 if t_counter.has_key?(s[0])
    min_str = nil

    return s[0] if t_size == c_found

    while right < s.size-1 || c_found == t_size do
        while c_found == t_size
            counter[s[left]]-=1
            if t_counter.has_key?(s[left]) && counter[s[left]] < t_counter[s[left]]
                min_str = s[left..right] if min_str.nil? || min_str.size > right-left
                c_found -= 1
            end
            left+=1
        end

        while c_found < t_size && right < s.size-1
            right+=1
            counter[s[right]]+=1
            if t_counter.has_key?(s[right]) && counter[s[right]] <= t_counter[s[right]]
                c_found+=1
            end
            if c_found==t_size
                min_str = s[left..right] if min_str.nil? || min_str.size > right-left
            end
        end
    end
    min_str ? min_str : ""
    
end
