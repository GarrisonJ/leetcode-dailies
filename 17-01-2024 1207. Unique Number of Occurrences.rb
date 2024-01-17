# @param {Integer[]} arr
# @return {Boolean}
def unique_occurrences(arr) 
    x = arr.tally.values
    x.count == x.uniq.count
end

