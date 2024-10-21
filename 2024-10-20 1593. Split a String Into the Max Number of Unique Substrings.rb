# @param {String} s
# @return {Integer}
def max_unique_split(s)
  @result = 0
  backtrack(s, 0, Set.new)
  @result
end

def backtrack(s, i, seen)
  if i >= s.size
    @result = [@result, seen.size].max
  else
    (i..s.size - 1).each do |j|
      next if seen.include?(s[i..j])

      seen.add(s[i..j])
      backtrack(s, j + 1, seen)
      seen.delete(s[i..j])
    end
  end
end
