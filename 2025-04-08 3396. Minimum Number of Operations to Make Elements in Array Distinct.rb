# @param {Integer[]} nums
# @return {Integer}
def minimum_operations(nums)
    index = nil
    seen = Set.new
    (nums.size-1).downto(0).each do |i|
        if seen.include?(nums[i])
            index = i
            break
        end
        seen.add(nums[i])
    end
    return 0 if index.nil?

    ans = (index+1) / 3
    ans += 1 if (index+1) % 3 != 0
    ans
end
