# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
    counter = Hash.new(0)
    extra = nil
    missing = nil
    nums.each do |n|
        counter[n] += 1
    end
    (1..nums.size).each do |i|
        if counter[i] == 0
            missing = i
        elsif counter[i] == 2
            extra = i
        end
        break if missing && extra
    end
    [extra, missing]
end
