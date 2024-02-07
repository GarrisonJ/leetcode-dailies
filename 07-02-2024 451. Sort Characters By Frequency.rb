# @param {String} s
# @return {String}
def frequency_sort(s) = s.chars.tally.sort_by {-_2}.map { _1 * _2 }.join
