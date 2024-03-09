# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def get_common(nums1, nums2)
    i = 0
    j = 0
    while i < nums1.size && j < nums2.size do
        if nums1[i] < nums2[j]
            i+=1
        elsif nums1[i] > nums2[j]
            j+=1
        else
            return nums1[i]
        end
    end
    return -1
end
