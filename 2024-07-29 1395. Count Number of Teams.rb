# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
    dp_gt = Array.new(rating.size) { Array.new(2, 0) }
    dp_lt = Array.new(rating.size) { Array.new(2, 0) }

    rating.size.times do |i|
        (0..i-1).each do |j|
            dp_gt[i][0] += 1 if rating[i] > rating[j]
            dp_lt[i][0] += 1 if rating[i] < rating[j]
        end
    end

    rating.size.times do |i|
        (0..i-1).each do |j|
            dp_gt[i][1] += dp_gt[j][0] if rating[i] > rating[j]
            dp_lt[i][1] += dp_lt[j][0] if rating[i] < rating[j]
        end
    end

    dp_gt.sum(&:last) + dp_lt.sum(&:last)
end
