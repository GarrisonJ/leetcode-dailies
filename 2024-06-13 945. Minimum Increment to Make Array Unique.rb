# @param {Integer[]} nums
# @return {Integer}
def min_increment_for_unique(nums) 
    nums.sort!
    result = 0
    max = nil
    nums.each do |n|
        if !max.nil? && n <= max
            result += (max-n)+1
            n = max+1
            max = n
        end
        max = n if max.nil? || n > max
    end
    result
end
