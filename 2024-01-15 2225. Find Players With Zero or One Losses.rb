def find_winners(matches)
    losses = {}
    matches.each do |match|
        losses[match[0]] ||= 0
        losses[match[1]] ||= 0
        losses[match[1]] += 1
    end

    ans = [[], []]

    losses.each do |player, loss|
        if loss == 0
            ans[0].append(player)
        elsif loss == 1
            ans[1].append(player)
        end
    end
    ans[0].sort!
    ans[1].sort!
    ans
end
