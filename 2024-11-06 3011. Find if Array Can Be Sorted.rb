# @param {Integer[]} nums
# @return {Boolean}
def can_sort_array(nums)
    prev_group_max = -Float::INFINITY
    curr_group_max = -Float::INFINITY
    curr_group_count = 0

    nums.each do |n|
        count = n.to_s(2).count("1")
        if  count != curr_group_count
            prev_group_max = curr_group_max
            curr_group_max = n
            curr_group_count = count
        else
            curr_group_max = [curr_group_max, n].max
        end
        return false if n < prev_group_max
    end
    true
end
