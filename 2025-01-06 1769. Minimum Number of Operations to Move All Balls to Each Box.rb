# @param {String} boxes
# @return {Integer[]}
def min_operations(boxes)
    n = boxes.size
    answer = Array.new(n, 0)
    balls_seen_l = 0
    ball_moves_l = 0
    balls_seen_r = 0
    ball_moves_r = 0
    n.times do |i|
        ball_moves_l += balls_seen_l
        if boxes[i] == '1'
            balls_seen_l += 1
        end
        answer[i] += ball_moves_l


        ball_moves_r += balls_seen_r
        if boxes[n-1-i] == '1'
            balls_seen_r += 1
        end
        answer[n-1-i] += ball_moves_r
    end
    answer
end
