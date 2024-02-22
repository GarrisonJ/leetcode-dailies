# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
    people = Array.new(n, 0)

    trust.each do |a,b|
        people[a-1] = -Float::INFINITY
        people[b-1] += 1
    end

    (people.index(n-1) or -2) + 1
end
