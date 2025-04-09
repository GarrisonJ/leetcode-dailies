# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
    set = Set.new
    nums.each do |n|
        if n < k
            return -1
        elsif n > k
            set.add(n)
        end
    end
    set.size
end
