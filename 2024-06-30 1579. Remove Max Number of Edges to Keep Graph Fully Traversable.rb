# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)

    type1 = edges.select { |edge| edge.first == 1 }
    type2 = edges.select { |edge| edge.first == 2 }
    type3 = edges.select { |edge| edge.first == 3 }

    alice_graph = DisjointUnion.new(n)
    bob_graph = DisjointUnion.new(n)
    result = 0
    type3.each do |edge|
        if alice_graph.conn?(edge[1], edge[2]) && bob_graph.conn?(edge[1], edge[2])
            result+=1
        else
            alice_graph.union(edge[1], edge[2])
            bob_graph.union(edge[1], edge[2])
        end
    end
    type1.each do |edge|
        if alice_graph.conn?(edge[1], edge[2]) 
            result+=1
        else
            alice_graph.union(edge[1], edge[2])
        end
    end
    type2.each do |edge|
        if bob_graph.conn?(edge[1], edge[2])
            result+=1
        else
            bob_graph.union(edge[1], edge[2])
        end
    end
    return -1 if alice_graph.comp != 1 || bob_graph.comp != 1
    result
end

class DisjointUnion
    attr_reader :comp
    def initialize(n)
        @parent = (0..n).to_a
        @rank = Array.new(n+1, 0)
        @comp = n
    end

    def find(a)
        return a if @parent[a] == a
        @parent[a] = find(@parent[a])
    end

    def conn?(a, b) = find(a) == find(b)

    def union(a, b)
        a_parent = find(a)
        b_parent = find(b)
        return if a_parent == b_parent

        @comp -= 1
        if @rank[a_parent] > @rank[b_parent]
            @parent[b_parent] = a_parent
            @rank[b_parent] += 1
        else
            @parent[a_parent] = b_parent
            @rank[a_parent] += 1
        end
    end

end
