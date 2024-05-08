# @param {Integer[]} score
# @return {String[]}
def find_relative_ranks(score)
    rankings = score.sort.reverse.each_with_index.to_h do |score, rank| 
        [score, ranking_to_string(rank+1)]
    end
    (0..score.size-1).map { |ath| rankings[score[ath]] }
end

def ranking_to_string(rank)
    case rank
    when 1 
        "Gold Medal"
    when 2 
        "Silver Medal"
    when 3 
        "Bronze Medal"
    else 
        rank.to_s
    end
end
