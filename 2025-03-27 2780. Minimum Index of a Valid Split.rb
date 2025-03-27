# @param {Integer[]} nums
# @return {Integer}
def minimum_index(nums)
    dom = nums.first
    count = 1
    (1..nums.size-1).each do |i|
        if nums[i] == dom
            count += 1
        elsif count == 0
            dom = nums[i]
            count = 1
        else
            count -= 1
        end
    end
    count = nums.count(dom)
    left_count = 0
    nums.size.times do |i|
        if nums[i] == dom
            left_count += 1
            count -= 1
        end
        return i if (left_count > (i+1)/2) && (count > (nums.size-(i+1))/2)
    end
    -1
end
