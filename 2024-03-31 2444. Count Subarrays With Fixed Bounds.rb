# @param {Integer[]} nums
# @param {Integer} min_k
# @param {Integer} max_k
# @return {Integer}
def count_subarrays(nums, min_k, max_k)
    
    result = 0
    min_pos = -1
    max_pos = -1
    left_bound = -1

    nums.each_with_index do |num, i|

        if num < min_k || num > max_k
            left_bound = i
        end

        if num == min_k
            min_pos = i
        end
        if num == max_k
            max_pos = i
        end

        result += [0, [min_pos, max_pos].min - left_bound].max
    end
    result
end


