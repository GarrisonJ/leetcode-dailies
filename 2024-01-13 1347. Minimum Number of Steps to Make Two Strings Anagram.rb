def min_steps(s, t)
    count = Hash.new(0)
    s.chars.tally(count)
    changes = 0
    t.each_char do |c|
        if count[c] > 0
            count[c]-=1
        else
            changes+=1
        end
    end
    changes
end
