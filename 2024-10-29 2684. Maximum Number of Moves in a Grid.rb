# @param {Integer[][]} grid
# @return {Integer}
def max_moves(grid)
  moves = Array.new(grid.size) { Array.new(grid[0].size, 0) }

  (grid[0].size - 2).downto(0).each do |col|
    grid.size.times do |row|
      if row - 1 >= 0 && col + 1 <= grid[0].size - 1 && grid[row][col] < grid[row - 1][col + 1]
        moves[row][col] = [moves[row][col], moves[row - 1][col + 1] + 1].max
      end
      if col + 1 <= grid[0].size - 1 && grid[row][col] < grid[row][col + 1]
        moves[row][col] = [moves[row][col], moves[row][col + 1] + 1].max
      end
      if row + 1 <= grid.size - 1 && col + 1 <= grid[0].size - 1 && grid[row][col] < grid[row + 1][col + 1]
        moves[row][col] = [moves[row][col], moves[row + 1][col + 1] + 1].max
      end
    end
  end
  moves.transpose[0].max
end
