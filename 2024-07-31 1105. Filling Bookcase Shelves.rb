# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
    @shelf_width = shelf_width
    @books = books
    @memo = {}
    solve(0, shelf_width, 0)
end


def solve(i, remaining_width, max_height)
    @memo[[i, remaining_width, max_height]] ||= begin
        return max_height if i >= @books.size

        option1 = Float::INFINITY
        if remaining_width-@books[i][0] >= 0
            option1 = solve(i+1, remaining_width-@books[i][0], [max_height, @books[i][1]].max)
        end
        option2 = max_height + solve(i+1, @shelf_width-@books[i][0], @books[i][1])

        [option1, option2].min
    end
end
