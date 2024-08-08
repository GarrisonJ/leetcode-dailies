# @param {Integer} rows
# @param {Integer} cols
# @param {Integer} r_start
# @param {Integer} c_start
# @return {Integer[][]}
def spiral_matrix_iii(rows, cols, r_start, c_start)
    result = []
    # Stop when result.size == rows*cols

    box_size = 1
    cur_size = 1
    up_box_size = 0
    dir = 'E'

    while result.size < rows*cols do 
        if r_start.between?(0, rows-1) && c_start.between?(0, cols-1)
            result << [r_start, c_start]
        end

        cur_size-=1
        

        case dir
        when 'E'
            c_start+=1
            if cur_size == 0
                dir = 'S' 
                cur_size = box_size
            end
        when 'S'
            r_start+=1
            if cur_size == 0
                dir = 'W' 
                cur_size = box_size
            end
        when 'W'
            c_start-=1
            if cur_size == 0
                dir = 'N' 
                cur_size = box_size
            end
        when 'N'
            r_start-=1
            if cur_size == 0
                dir = 'E'
                cur_size = box_size
            end
        end
        if cur_size == box_size
            up_box_size+=1
            if up_box_size == 2
                box_size+=1
                up_box_size = 0
                cur_size = box_size
            end
        end
    end

    result
end
