# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_subarray_sum(nums, k)
    max_sum = 0
    counter = Hash.new(0)
    num_dup = 0
    i = 0
    j = 0
    counter[nums[j]]+=1

    cur_sum = nums[j]
    while j < k-1 do 
        j+=1
        counter[nums[j]]+=1
        cur_sum += nums[j]
        num_dup += 1 if counter[nums[j]] == 2
    end
    max_sum = [max_sum, cur_sum].max if num_dup == 0

    while j < nums.size-1 do
        cur_sum -= nums[i]
        counter[nums[i]] -= 1
        num_dup -= 1 if counter[nums[i]] == 1
        i+=1
        j+=1
        cur_sum += nums[j]
        counter[nums[j]] += 1
        num_dup += 1 if counter[nums[j]] == 2
        max_sum = [max_sum, cur_sum].max if num_dup == 0
    end
    max_sum
end
