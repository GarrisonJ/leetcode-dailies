# @param {Integer[]} tokens
# @param {Integer} power
# @return {Integer}
def bag_of_tokens_score(tokens, power)
    tokens.sort!
    score = 0
    max_score = 0
    face_up = 0
    face_down = tokens.size - 1
    while face_up <= face_down do 
        if power >= tokens[face_up]
            score+=1
            max_score = [max_score, score].max
            power -= tokens[face_up]
            face_up+=1
        elsif score == 0
            break
        else
            score-=1 
            power += tokens[face_down]
            face_down-=1
        end
    end
    max_score
end
