# @param {Integer[]} banned
# @param {Integer} n
# @param {Integer} max_sum
# @return {Integer}
def max_count(banned, n, max_sum)
    sum = 0
    banned = Set.new(banned)
    count = 0
    (1..n).each do |i|
        next if banned.include?(i)
        if sum + i > max_sum
            break
        else
            sum += i
            count += 1
        end
    end
    count
end
