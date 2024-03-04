# @param {Integer[]} nums
# @return {Integer[]}
def rearrange_array(nums)
    ans = []
    neg = 0
    pos = 0
    while ans.size < nums.size do 
        while nums[pos] < 0 do
            pos += 1
        end
        ans << nums[pos]
        pos+=1
        while nums[neg] >= 0 do
            neg += 1
        end
        ans << nums[neg]
        neg+=1
    end
    ans
end
