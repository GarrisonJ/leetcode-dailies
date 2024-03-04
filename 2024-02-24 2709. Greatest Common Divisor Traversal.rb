MAX = 100000
# @param {Integer[]} nums
# @return {Boolean}
def can_traverse_all_pairs(nums)
    return true if nums.size == 1
    return false if nums.include?(1)
    nums.uniq!
    has = Set.new(nums)

    du = DisjointUnion.new(MAX + 1)
    nums.each do |x|
        val = x
        while val > 1 do
            prime = sieve[val]
            root = prime
            du.union(root, x) 
            while (val % prime) == 0 do
                val /= prime
            end
        end
    end

    one_root = false
    has.each do |i|
        if du.find(i) == i
            return false if one_root
            one_root = true
        end
    end
    true
end

def sieve
    @sieve ||= begin 
        sieve = Array.new(MAX+1, 0)
        (2..MAX).each do |d|
            if sieve[d] == 0
                (d..MAX).step(d).each do |v|
                    sieve[v] = d
                end
            end
        end
        sieve
    end
end


class DisjointUnion
    attr_accessor :count
    def initialize(n)
        @rank = Array.new(n+1, 1)
        @root = (0..n).to_a
    end

    def find(node)
        root = @root[node]
        if root == node
            root
        else
            @root[node] = find(root)
        end
    end

    def union(a, b)
        root_a = find(a)
        root_b = find(b)

        if root_a != root_b
            if @rank[root_a] < @rank[root_b]
                @root[root_a] = root_b
            elsif @rank[root_a] > @rank[root_b]
                @root[root_b] = root_a
            else
                @root[root_a] = root_b
                @rank[root_b] += 1
            end
        end
    end

end
