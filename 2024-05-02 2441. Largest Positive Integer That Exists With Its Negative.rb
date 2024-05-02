# @param {Integer[]} nums
# @return {Integer}
def find_max_k(nums)

    largest = nil
    nums = Set.new(nums)

    nums.each do |i|
        if largest.nil? || i > largest
            if nums.include?(-i)
                largest = i
            end
        end
    end
    largest.nil? ? -1 : largest
end
