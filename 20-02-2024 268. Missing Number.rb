# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    sorted = Array.new(nums.size+1, false)
    nums.each do |num|
        sorted[num] = true
    end
    sorted.index(false)
end
