# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(nums, k)
    subarrays_with_at_most_k(nums, k) - subarrays_with_at_most_k(nums, k-1)
end


def subarrays_with_at_most_k(nums, k)
    return 0 if k == 0
    counter = Hash.new(0)
    left = 0
    result = 0

    nums.size.times do |right|
        counter[nums[right]]+=1

        while counter.size > k do
            counter[nums[left]]-=1
            counter.delete(nums[left]) if counter[nums[left]] == 0
            left+=1
        end
        result += (right - left) + 1
    end 
    result
end

