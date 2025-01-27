# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @param {Integer[][]} queries
# @return {Boolean[]}
def check_if_prerequisite(num_courses, prerequisites, queries)
    adj = Array.new(num_courses) { Set.new }
    prerequisites.each do |pre, course|
        adj[course] << pre
    end
    @is_reachable = Array.new(num_courses) { Array.new(num_courses) }
    ans = []
    queries.each do |q|
        ans << pre_req?(adj, q.last, q.first)
    end
    ans
end

def pre_req?(graph, course, pre_req)
    return @is_reachable[course][pre_req] if !@is_reachable[course][pre_req].nil?
    if graph[course].include?(pre_req)
        return @is_reachable[course][pre_req] = true
    end

    graph[course].each do |c|
        @is_reachable[course][pre_req] = pre_req?(graph, c, pre_req)
        return true if @is_reachable[course][pre_req]
    end
    @is_reachable[course][pre_req] = false
end
