# @param {String} s
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def maximum_gain(s, x, y)
    ab = ["a", "b"]
    ba = ["b", "a"]
    if x < y
        x,y = y,x
        ab, ba = ba, ab
    end

    result = 0
    stack = []

    s.each_char do |c|
        stack << c
        while stack[-2, 2] == ab
            stack.pop
            stack.pop
            result += x
        end
    end
    s = stack.join
    stack = []

    s.each_char do |c|
        stack << c
        while stack[-2, 2] == ba
            stack.pop
            stack.pop
            result += y
        end
    end
    result
end
