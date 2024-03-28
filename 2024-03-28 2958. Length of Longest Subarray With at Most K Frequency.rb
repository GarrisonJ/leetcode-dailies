# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_subarray_length(nums, k)
    counter = Hash.new(0)
    left = 0
    right = 0
    counter[nums[0]]+=1
    result = 1
    while right < nums.size-1 do 
        
        right+=1
        counter[nums[right]]+=1
        
        while counter[nums[right]] > k do
            counter[nums[left]] -= 1
            left+=1
        end
        result = [result, (right-left)+1].max
    end
    result
end
