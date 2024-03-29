# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_subarrays(nums, k)
    max = nums.max
    count = 0

    counter = Hash.new(0)
    left = 0 
    right = 0
    counter[nums[0]]+=1
    count += 1 if nums[0] == max && 1 == k

    while right < nums.size-1 do
        right+=1
        counter[nums[right]]+=1

        while counter[max] >= k do
            counter[nums[left]] -= 1
            left+=1
        end
        count+=left
    end
    count
end
