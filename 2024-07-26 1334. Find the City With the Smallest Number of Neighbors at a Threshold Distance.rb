# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
def find_the_city(n, edges, distance_threshold)
    dist = Array.new(n) { Array.new(n, Float::INFINITY) }

    edges.each do |from, to, weight|
        dist[from][to] = weight
        dist[to][from] = weight
    end
    n.times do |i|
        dist[i][i] = 0
    end

    n.times do |mid|
        n.times do |from|
            n.times do |to|
                if dist[from][mid] + dist[mid][to] < dist[from][to]
                    dist[from][to] = dist[from][mid] + dist[mid][to]
                end
            end
        end
    end

    result = nil
    min_cities = nil
    dist.map do |row|
        row.count { |dst| dst <= distance_threshold } - 1
    end.each_with_index do |count, city|
        result = city if result.nil? || count <= min_cities
        min_cities = count if min_cities.nil? || min_cities >= count
    end    
    result
end
