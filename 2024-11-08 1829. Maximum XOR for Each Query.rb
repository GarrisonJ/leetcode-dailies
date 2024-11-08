# @param {Integer[]} nums
# @param {Integer} maximum_bit
# @return {Integer[]}
def get_maximum_xor(nums, maximum_bit)
    largest = (1 << maximum_bit) - 1
    ans = []
    curr = 0
    nums.each do |n|
        curr ^= n
        ans << (curr ^ largest)
    end
    ans.reverse
end
