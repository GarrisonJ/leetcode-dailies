# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[][]}
def divide_array(nums, k)
    ans = []
    nums.sort!
    i = 0
    while i < nums.size
        ans.append([])
        3.times do |_|
            return [] if ans[-1].any? && ans[-1].any? { |e| (e-nums[i]).abs > k }
            ans[-1].append(nums[i])
            i+=1
        end
    end
    ans
end
