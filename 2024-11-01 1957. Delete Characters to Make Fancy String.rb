# @param {String} s
# @return {String}
def make_fancy_string(s)
  result = []

  s.each_char do |c|
    result.pop while result.size >= 2 && c == result[-1] && c == result[-2]
    result << c
  end
  result.join
end
