# @param {Integer[][]} grid
# @param {Integer} x
# @return {Integer}
def min_operations(grid, x)
    nums = grid.flatten.sort
    mid = nums[nums.size/2]
    ans = 0
    nums.each do |n|
        return -1 if n % x != mid % x
        ans += (n - mid).abs / x
    end
    ans
end
