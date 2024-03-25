# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
    ans = []
    nums.each do |n|
        n = n.abs
        if nums[n-1] < 0
            ans << n
        else
            nums[n-1] = (-1)*nums[n-1]
        end
    end
    ans
end
