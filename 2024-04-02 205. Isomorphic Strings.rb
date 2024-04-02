# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
    hash = {}
    mapped = Set.new

    s.chars.each_with_index do |c, i|
        if !hash.has_key?(c) && !mapped.include?(t[i])
            hash[c] = t[i] 
            mapped.add(t[i])
        end
        return false if hash[c] != t[i]
    end 
    true
end
