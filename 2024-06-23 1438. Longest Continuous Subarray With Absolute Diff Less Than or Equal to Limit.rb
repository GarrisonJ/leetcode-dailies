# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def longest_subarray(nums, limit)
    i = 0
    j = 0
    list = SortedList.new
    list.add(nums[i])
    result = 1
    while j < nums.size-1 do
        j+=1
        list.add(nums[j])

        while list.diff > limit do
            list.remove(nums[i])
            i+=1
        end
        result = [result, (j-i)+1].max
    end
    result
end


class SortedList
    attr_accessor :sorted

    def initialize
        @sorted = []
    end

    def diff
        max - min
    end

    def max
        @sorted.last
    end

    def min
        @sorted.first
    end

    def add(x)
        index = @sorted.bsearch_index { |i| i >= x } || @sorted.size
        @sorted.insert(index, x)
    end

    def remove(x)
        index = @sorted.bsearch_index { |i| i >= x } 
        if !index.nil? && @sorted[index] == x
            @sorted.delete_at(index)
        end
        nil
    end
end
