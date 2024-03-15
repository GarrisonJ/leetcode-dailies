# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    output = nums.dup
    (1..output.size-1).each do |i|
        output[i] = output[i] * output[i-1]
    end
    (nums.size-2).downto(0).each do |i|
        nums[i] = nums[i]*nums[i+1]
    end
    first = nums[1]
    last = output[-2]
    (output.size-2).downto(1).each do |i|
        output[i] = output[i-1] * nums[i+1]
    end
    output[0] = first
    output[-1] = last
    output
end
