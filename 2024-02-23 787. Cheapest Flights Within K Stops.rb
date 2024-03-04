# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
    
    prev =  Array.new(n, Float::INFINITY)
    prev[src] = 0
    curr = prev.dup
            
    (k+1).times do |_|
        flights.each do |from, to, price|
            curr[to] = [curr[to], prev[from] + price].min
        end

        prev = curr.dup
    end
    curr[dst] == Float::INFINITY ? -1 : curr[dst]
end
