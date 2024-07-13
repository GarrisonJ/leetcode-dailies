# @param {Integer[]} positions
# @param {Integer[]} healths
# @param {String} directions
# @return {Integer[]}
def survived_robots_healths(positions, healths, directions)
    n = positions.size
    robots = []

    n.times do |i|
        robots << [positions[i], healths[i], directions[i]]
    end
    robots.sort!

    left_robots = []
    right_robots = []
    i = n-1
    while i >= 0 do
        if robots[i][2] == "L"
            left_robots.prepend(robots[i])
            i-=1
        elsif robots[i][2] == "R" && !left_robots.empty?
            if robots[i][1] == left_robots.first[1]
                left_robots.shift
                i-=1
            elsif robots[i][1] < left_robots.first[1]
                left_robots.first[1] -= 1
                i-=1
            elsif robots[i][1] > left_robots.first[1]
                left_robots.shift
                robots[i][1] -= 1
            end
        else # robots[i][2] == "R"
            right_robots.prepend(robots[i])
            i-=1
        end
    end

    robots = Array.new(n)

    positions_to_index = {}
    n.times do |i|
        positions_to_index[positions[i]] = i
    end

    left_robots.each do |robot|
        robots[positions_to_index[robot[0]]] = robot[1]
    end
    right_robots.each do |robot|
        robots[positions_to_index[robot[0]]] = robot[1]
    end

    robots.compact!
    robots
end
