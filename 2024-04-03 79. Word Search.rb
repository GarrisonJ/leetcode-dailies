# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
    chars = Set.new(board.flat_map { |x| x })
    return false if word.chars.any? { |c| !chars.include?(c) }

    board.size.times do |i|
        board[0].size.times do |j|
            return true if dfs(board, i, j, word, 0)
        end
    end
    false
end

def dfs(board, i, j, word, ptr)
    return false if !i.between?(0, board.size-1)
    return false if !j.between?(0, board[0].size-1)
    return false if word[ptr] != board[i][j]
    board[i][j] = '#'

    return true if ptr == word.size-1

    return true if dfs(board, i-1, j, word, ptr+1)
    return true if dfs(board, i+1, j, word, ptr+1)
    return true if dfs(board, i, j-1, word, ptr+1)
    return true if dfs(board, i, j+1, word, ptr+1)
    board[i][j] = word[ptr]
    false
end
