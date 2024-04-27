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
