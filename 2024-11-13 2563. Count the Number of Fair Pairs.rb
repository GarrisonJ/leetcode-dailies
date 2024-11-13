# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_fair_pairs(nums, lower, upper)
    sorted_list = [nums[-1]]
    count = 0
    (nums.size-2).downto(0).each do |i|
        count += how_many_in_range(lower-nums[i], upper-nums[i], sorted_list)
        index = sorted_list.bsearch_index { |x| x >= nums[i] } || sorted_list.size
        sorted_list.insert(index, nums[i])
    end
    count
end

def how_many_in_range(lower, upper, sorted_list)
    the_start = sorted_list.bsearch_index { |x| x >= lower }
    the_end = sorted_list.bsearch_index { |x| x > upper }
    return 0 if the_start.nil?
    return sorted_list.size - the_start if the_end.nil?
    the_end - the_start 
end
