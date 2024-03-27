# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
    
    count = 0
    left = 0
    right = 0
    prod = nums[0]
    count += 1 if prod < k
    while right < nums.size-1 do 
        right+=1
        prod *= nums[right]

        while prod >= k && left < right do
            prod /= nums[left]
            left+=1
        end

        count += (right-left) + 1 if prod < k
    end
    count
end
