# @param {Integer[]} mapping
# @param {Integer[]} nums
# @return {Integer[]}
def sort_jumbled(mapping, nums)
    hash = Hash.new
    mapping.each_with_index do |m, i|
        hash[i.to_s] = m.to_s
    end
    nums.map do |n|
        sortable = n.to_s.chars.map { |c| hash[c] }.join.to_i
        [sortable, n]
    end.sort_by(&:first).map(&:last)
end
