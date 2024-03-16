# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
    memo = {}
    memo[0] = -1
    sum = 0
    max_len = 0
    nums.each_with_index do |num, index|
        sum += 1 if num==1
        sum -= 1 if num==0
        if memo.has_key?(sum)
            max_len = [max_len, index-memo[sum]].max
        end
        memo[sum] = index if !memo.has_key?(sum)
    end
    max_len
end
