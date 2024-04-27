# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
    @key_len = key.size
    @ring_len = ring.size
    @key = key
    @ring = ring
    @memo = {}
    try_lock(0, 0)

end

def count_steps(curr, next_curr)
    steps_between = (curr-next_curr).abs
    steps_around = @ring_len - steps_between
    [steps_between, steps_around].min
end

def try_lock(ring_index, key_index)
    @memo[[ring_index, key_index]] ||= begin
        return 0 if key_index == @key_len
        min_steps = Float::INFINITY
        @ring_len.times do |i|
            if @ring[i] == @key[key_index]
                min_steps = [
                    min_steps, 
                    count_steps(ring_index, i) + 1 + try_lock(i, key_index + 1)
                ].min
            end
        end
        min_steps
    end
end


# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
    mod = ring.size
    queue = [[0, 0, 0]] # Location, key_location, steps
    seen = Set.new([[0,0]])
    while !queue.empty? do
        location, key_location, steps = queue.shift
        if ring[location] == key[key_location]
            key_location+=1
            return steps+1 if key_location == key.size
            if !seen.include?([location, key_location])
                queue << [location, key_location, steps+1]
                seen << [location, key_location]
            end
        else
            if !seen.include?([(location+1) % mod, key_location])
                queue << [(location+1) % mod, key_location, steps+1]
                seen << [(location+1) % mod, key_location]
            end
            back_location = (location-1) % mod
            back_location = ring.size + back_location if back_location.negative?
            if !seen.include?([back_location, key_location])
                queue << [back_location, key_location, steps+1]
                seen << [back_location, key_location]
            end
        end
    end
    raise "Invalid input"
end
