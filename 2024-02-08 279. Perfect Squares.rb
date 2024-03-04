# @param {Integer} n
# @return {Integer}
def num_squares(n)
    @memo = {}
    squares = []
    (1..).each do |i|
        break if i*i > n
        squares << i*i
    end
    solve(squares, squares.size-1, n)
end

def solve(squares, i, n)
    @memo[[i,n]] ||= begin
        return n if i==0
        return solve(squares, i-1, n) if squares[i] > n
        count = n/squares[i]
        sum = (n/squares[i])*squares[i]

        if sum == n
            count
        else
            [
                count + solve(squares, i-1, n-sum), 
                solve(squares, i-1, n)
            ].min
        end
    end
end
