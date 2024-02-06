# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    groups = Hash.new { |h,k| h[k] = [] }

    strs.each do |str|
        groups[str.chars.sort].append(str)
    end

    groups.values  
end
