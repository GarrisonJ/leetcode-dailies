# @param {String} word
# @return {Integer}
def wonderful_substrings(word)
    count = 0
    bitmask = 0
    freq = Hash.new
    freq[0] = 1

    word.chars.each do |c|
        bitmask ^= (1 << (c.ord - 'a'.ord))

        if freq.has_key?(bitmask)
            count += freq[bitmask]
            freq[bitmask] += 1
        else
            freq[bitmask] = 1
        end
        
        (0..9).each do |j|
            check_mask = bitmask ^ (1 << j)
            count += freq[check_mask] if freq.has_key?(check_mask)
        end
        
    end
    count
end
