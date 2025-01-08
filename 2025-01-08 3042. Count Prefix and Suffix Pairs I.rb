# @param {String[]} words
# @return {Integer}
def count_prefix_suffix_pairs(words)
    # O(n^2)
    ans = 0
    (0..words.size-2).each do |i|
        (i+1..words.size-1).each do |j|
            ans += 1 if is_prefix_and_suffix(words[i], words[j])
        end
    end
    ans
end

def is_prefix_and_suffix(a, b)
    a == b[..a.size-1] && a == b[-a.size..]
end
