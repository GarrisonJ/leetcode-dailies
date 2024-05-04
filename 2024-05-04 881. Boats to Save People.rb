# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
    people.sort!
    boats = 0
    i = 0
    j = people.size-1
    while i <= j do
        boats+=1
        i+=1 if people[i] + people[j] <= limit
        j-=1
    end
    boats
end

