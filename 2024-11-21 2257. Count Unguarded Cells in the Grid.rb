# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} guards
# @param {Integer[][]} walls
# @return {Integer}
def count_unguarded(m, n, guards, walls)
    grid = Array.new(m) { Array.new(n) }

    guards.each do |x, y|
        grid[x][y] = 'G'
    end
    walls.each do |x, y|
        grid[x][y] = 'W'
    end

    m.times do |i|
        n.times do |j|
            fill_in_guard(grid, i, j) if grid[i][j] == 'G'
        end
    end

    count = 0
    m.times do |i|
        n.times do |j|
            count += 1 if grid[i][j].nil?
        end
    end
    count
end

def fill_in_guard(grid, i, j)
    ((i+1)..grid.size-1).each do |k|
        break if grid[k][j] == "W" || grid[k][j] == "G"
        grid[k][j] = "S"
    end
    ((i-1).downto(0)).each do |k|
        break if grid[k][j] == "W" || grid[k][j] == "G"
        grid[k][j] = "S"
    end

    ((j+1)..grid[0].size-1).each do |k|
        break if grid[i][k] == "W" || grid[i][k] == "G"
        grid[i][k] = "S"
    end
    (j-1).downto(0).each do |k|
        break if grid[i][k] == "W" || grid[i][k] == "G"
        grid[i][k] = "S"
    end
end
