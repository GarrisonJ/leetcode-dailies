# @param {Integer[]} happiness
# @param {Integer} k
# @return {Integer}
def maximum_happiness_sum(happiness, k)
    happiness.sort!
    sum = 0
    k.times do |i|
        value = happiness.pop-i
        break if value <= 0
        sum += value
    end
    sum
end
