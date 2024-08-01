# @param {String[]} details
# @return {Integer}
def count_seniors(details) = details.count { |d| d[11..12].to_i > 60 }
