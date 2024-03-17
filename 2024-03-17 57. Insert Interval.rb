# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
    new_intervals = []
    intervals.each do |start, stop|
        if new_interval.nil?
            new_intervals << [start, stop]
        elsif stop < new_interval[0]
            new_intervals << [start, stop]
        elsif !(start < new_interval[0] && stop < new_interval[0]) &&
                !(start > new_interval[1] && stop > new_interval[1])
            new_interval = [[new_interval[0], start].min, [new_interval[1], stop].max]
        else 
            new_intervals << new_interval
            new_intervals << [start, stop]
            new_interval = nil
        end
    end
    new_intervals << new_interval if !new_interval.nil?
    new_intervals
end
