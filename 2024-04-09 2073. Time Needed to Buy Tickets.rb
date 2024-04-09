# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
    seconds = 0
    loop do
        seconds+=1
        person = tickets.shift

        if person == 1
            if k == 0
                return seconds
            end
        else
            tickets << (person-1)
        end
        k = (k-1) % tickets.size
    end
    throw "Something has gone seriously wrong"
end

# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
    seconds = 0
    tickets.each_with_index do |person, i|
        if i <= k
            seconds += [person, tickets[k]].min
        else
            seconds += [person, tickets[k]-1].min
        end
    end
    seconds
end
