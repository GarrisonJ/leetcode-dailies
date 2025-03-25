# @param {Integer} n
# @param {Integer[][]} rectangles
# @return {Boolean}
def check_valid_cuts(n, rectangles)
    y_values = rectangles.map { |x| [x[1], x[3]] }.sort_by { |x| x.first }
    count = 0
    prev_stop = y_values[0][1]
    y_values.each do |start, stop|
        if prev_stop <= start
            count += 1
            prev_stop = stop
        else
            prev_stop = [stop, prev_stop].max
        end
    end
    return true if count >= 2

    x_values = rectangles.map { |x| [x[0], x[2]] }.sort_by { |x| x.first }
    count = 0
    prev_stop = x_values[0][1]
    x_values.each do |start, stop|
        if prev_stop <= start
            count += 1
            prev_stop = stop
        else
            prev_stop = [stop, prev_stop].max
        end
    end
    count >= 2
end
