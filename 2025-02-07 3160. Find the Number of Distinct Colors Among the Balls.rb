# @param {Integer} limit
# @param {Integer[][]} queries
# @return {Integer[]}
def query_results(limit, queries)
    ball_to_color = Hash.new
    color_count = Hash.new(0)
    num_colors = 0
    answers = []
    queries.each do |ball, color|
        if !ball_to_color[ball].nil?
            color_count[ball_to_color[ball]] -= 1
            num_colors -= 1 if color_count[ball_to_color[ball]] == 0
        end
        ball_to_color[ball] = color
        color_count[color] += 1
        num_colors += 1 if color_count[color] == 1
        answers << num_colors
    end
    answers
end
