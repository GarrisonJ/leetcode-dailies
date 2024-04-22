# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)
    seen = Set.new(deadends)
    queue = ['0000']
    steps = 0
    return -1 if seen.include?('0000')

    while !queue.empty? do
        size = queue.size

        size.times do |_|
            node = queue.shift
            return steps if node == target
            
            4.times do |i|
                new_node = node.dup
                new_node[i] = ((new_node[i].to_i + 1) % 10).to_s
                if !seen.include?(new_node)
                    queue << new_node 
                    seen.add(new_node)
                end

                new_node = node.dup
                new_node[i] = ((new_node[i].to_i - 1) % 10).to_s
                if !seen.include?(new_node)
                    queue << new_node 
                    seen.add(new_node)
                end
            end   
        end
        steps += 1
    end
    return -1
end
