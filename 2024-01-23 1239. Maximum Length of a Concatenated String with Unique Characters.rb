# @param {String[]} arr
# @return {Integer}
def max_length(arr)
    arr_set = Set.new
    arr.each do |str|
        mask = 0
        dup = false
        str.each_char do |c| 
            if mask & (1 << (c.ord - 97)) == 0
                mask = mask | (1 << (c.ord - 97))
            else
                dup = true
                break
            end
        end
        arr_set.add(mask) if !dup
    end
    arr = arr_set.to_a
    @ans = 0
    solve(0, 0, arr).size
    @ans
end

def solve(s, i, arr)
    if i==arr.size
        @ans = s.to_s(2).count("1") if s.to_s(2).count("1") > @ans
        return s.to_s(2).count("1")
    end
    res = []
    res << solve(s | arr[i], i+1, arr) if s & arr[i] == 0
    res << solve(s, i+1, arr)
    res.max
end
