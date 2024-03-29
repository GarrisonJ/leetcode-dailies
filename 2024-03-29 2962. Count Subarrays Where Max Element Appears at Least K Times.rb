# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_subarrays(nums, k)
    max = nums.max
    count = 0

    counter = 0
    left = 0
    right = 0
    counter+=1 if nums[0] == max
    count += 1 if counter == k

    while right < nums.size-1 do
        right+=1
        counter+=1 if nums[right] == max

        while counter >= k do
            counter -= 1 if nums[left] == max
            left+=1
        end
        count+=left
    end
    count
end
