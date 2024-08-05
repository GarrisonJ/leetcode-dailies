# @param {String[]} arr
# @param {Integer} k
# @return {String}
def kth_distinct(arr, k)
    counter = arr.tally

    arr.each do |s|
        k-= 1 if counter[s] == 1
        return s if k == 0
    end
    ""
end
