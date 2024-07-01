# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
    count = 0

    arr.each do |num|
        if num.odd?
            count+=1
        else
            count = 0
        end
        return true if count == 3
    end
    false
end
