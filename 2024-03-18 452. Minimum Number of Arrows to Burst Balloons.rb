# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
    return 0 if points.empty?
    points.sort!
    arrows = 0
    i = 0 
    range = points[0]
    while i < points.size do
        if !(range[1] < points[i][0])
            range[0] = points[i][0]
            range[1] = [range[1], points[i][1]].min
        else
            range = points[i]
            arrows+=1
        end
        i+=1
    end
    arrows+1
end
