# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
    counts = arr.tally.to_a.sort_by { |x| -x.last }
    k.times do |_|
        counts[-1][1] -= 1
        counts.pop if counts[-1][1] == 0
    end
    counts.size
end
