# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_subarray_length(nums, k)

    i = 0
    j = 0
    bit_counter = Array.new(32, 0)
    min_array = Float::INFINITY
    add_to_bit_counter(bit_counter, nums[0])
    return 1 if bit_counter_to_i(bit_counter) >= k

    while j < nums.size-1 do 

        if bit_counter_to_i(bit_counter) >= k
            min_array = [min_array, (j-i)+1].min
            remove_to_bit_counter(bit_counter, nums[i])
            i+=1
        else
            j+=1 
            add_to_bit_counter(bit_counter, nums[j])
        end
    end
    while bit_counter_to_i(bit_counter) >= k && i <= j
        min_array = [min_array, (j-i)+1].min
        remove_to_bit_counter(bit_counter, nums[i])
        i+=1
    end

    min_array == Float::INFINITY ? -1 : min_array
end

def add_to_bit_counter(bit_counter, num)
    bit_position = 0
    while num > 0
      bit_counter[bit_position] += 1 if num & 1 == 1
      num >>= 1 
      bit_position += 1
    end
end

def remove_to_bit_counter(bit_counter, num)
    bit_position = 0
    while num > 0
      bit_counter[bit_position] -= 1 if num & 1 == 1
      num >>= 1
      bit_position += 1
    end
end

def bit_counter_to_i(bit_counter)
    result = 0
    bit_counter.each_with_index do |count, position|
        result |= (1 << position) if count > 0
    end
    result
end
