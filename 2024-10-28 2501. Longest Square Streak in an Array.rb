# @param {Integer[]} nums
# @return {Integer}
def longest_square_streak(nums)
  included = nums.to_set

  max = -1
  nums.each do |n|
    nn = n**2
    count = 1
    while included.include?(nn)
      count += 1
      max = [max, count].max
      nn **= 2
    end
  end
  max
end
