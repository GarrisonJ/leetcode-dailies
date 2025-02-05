# @param {String} s1
# @param {String} s2
# @return {Boolean}
def are_almost_equal(s1, s2)
    miss_match_index = nil
    swap = false
    s1.size.times do |i|
        if s1[i] != s2[i]
            if miss_match_index.nil?
                miss_match_index = i
            elsif swap
                return false
            else
                if s1[i] == s2[miss_match_index] && s2[i] == s1[miss_match_index]
                    swap = true
                else
                    return false
                end
            end
        end
    end
    miss_match_index.nil? || (!miss_match_index.nil? && swap)
end
