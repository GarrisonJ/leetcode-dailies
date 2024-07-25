# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
    return nums if sorted?(nums)
    return nums.reverse! if sorted?(nums.reverse)
    sort(nums, 0, nums.size-1)
    nums
end

def sorted?(nums)
    (nums.size-1).times do |i|
        return false if nums[i] > nums[i+1]
    end
    true
end

def sort(nums, i, j)
    return if i >= j

    if i+1 == j
        nums[i], nums[j] = nums[j], nums[i] if nums[j] < nums[i]
        return
    end

    ran = rand(i..j)
    nums[ran], nums[i] = nums[i], nums[ran]

    pivot = i

    left = i + 1
    right = j
    while left < right do
        if nums[pivot] < nums[left]
            nums[right], nums[left] = nums[left], nums[right]
            right-=1
        else
            left+=1
        end
    end

    left = left-1 if nums[left] > nums[pivot]

    nums[pivot], nums[left] = nums[left], nums[pivot]

    sort(nums, i, left-1)
    sort(nums, left+1, j)
end
