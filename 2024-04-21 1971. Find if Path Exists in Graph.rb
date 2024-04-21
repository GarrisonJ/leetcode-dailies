# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @return {Boolean}
def valid_path(n, edges, source, destination)
    graph = Hash.new() { |h,k| h[k] = Array.new }
    edges.each do |from, to|
        graph[from] << to
        graph[to] << from
    end

    queue = [source]
    seen = [false] * n
    seen[source] = true

    while !queue.empty? do 
        from = queue.shift
        
        graph[from].each do |to|
            return true if to == destination
            if !seen[to]
                seen[to] = true
                queue << to
            end
        end
    end
    seen[destination]
end
