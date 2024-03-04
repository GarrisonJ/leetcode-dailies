# @param {Integer[]} heights
# @param {Integer} bricks
# @param {Integer} ladders
# @return {Integer}
def furthest_building(heights, bricks, ladders)
    ladders_used = MinHeap.new
    (1..heights.size-1).each do |i|
        jump = heights[i] - heights[i-1]

        if jump > 0
            if ladders_used.size < ladders
                ladders_used.push(jump)
            else
                if ladders_used.size > 0 && ladders_used.min < jump
                    bricks -= ladders_used.pop
                    ladders_used.push(jump)
                else
                    bricks -= jump
                end
            end
            return i-1 if bricks < 0
        end
    end
    return heights.size-1
end
