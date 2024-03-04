# @param {Integer} n
# @param {Integer[][]} meetings
# @return {Integer}
def most_booked(n, meetings)
    meetings.sort!
    free_rooms = MinHeap.new((0..n-1).to_a.reverse)
    end_times = MinHeap.new
    counts = Array.new(n, 0)
    meetings.each do |start, stop|
        while !end_times.empty? && end_times.min[0] <= start do
            free_rooms.push(end_times.pop.last)
        end
        if !free_rooms.empty? 
            room = free_rooms.pop
            end_times.push([stop, room])
            counts[room]+=1
        else
            end_time, room = end_times.pop
            counts[room]+=1
            end_times.push([end_time+(stop-start), room])
        end
    end
    counts.each_index.max_by{ counts[_1] }
end

class MinHeap
    def initialize(heap = [])
        @heap = heap
    end
    def inspect
        @heap.inspect
    end
    def push(a)
        i = @heap.bsearch_index { |x| (a <=> x) > 0  } || @heap.size
        @heap.insert(i, a)
    end
    def min
        @heap[-1]
    end
    def pop
        @heap.pop
    end
    def empty?
        @heap.empty?
    end
end
