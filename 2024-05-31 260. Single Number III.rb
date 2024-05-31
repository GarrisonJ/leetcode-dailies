# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    result = []
    counter = nums.tally
    counter.each do |v, count|
        result << v if count == 1
    end
    result
end
