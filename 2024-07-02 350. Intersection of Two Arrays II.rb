# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    counter = nums2.tally(Hash.new(0))

    result = []
    nums1.each do |num|
        if counter[num] > 0
            result << num
            counter[num]-=1
        end
    end 
    result
end
