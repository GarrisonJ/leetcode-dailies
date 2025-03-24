# @param {Integer} days
# @param {Integer[][]} meetings
# @return {Integer}
def count_days(days, meetings)
    meetings.sort_by! { |x| x.first }
    prev_end = 0
    avail = days

    meetings.each do |start, last|
        if last <= prev_end
            next
        elsif start <= prev_end
            avail -= (last - (prev_end+1)) + 1
            prev_end = last
        else
            avail -= (last - start) + 1
            prev_end = last
        end
    end

    avail
end

