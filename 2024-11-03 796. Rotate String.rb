# @param {String} s
# @param {String} goal
# @return {Boolean}
def rotate_string(s, goal)
    return false if s.size != goal.size
    (s+s).include?(goal)
end
