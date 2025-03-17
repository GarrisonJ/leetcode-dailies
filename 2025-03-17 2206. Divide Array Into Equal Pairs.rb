# @param {Integer[]} nums
# @return {Boolean}
def divide_array(nums)
    nums.tally.each do |_, c|
        return false if c.odd?
    end
    true
end
