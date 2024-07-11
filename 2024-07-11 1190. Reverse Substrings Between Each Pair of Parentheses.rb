# @param {String} s
# @return {String}
def reverse_parentheses(s)
    stack = []

    s.each_char do |c|
        if c == ")"
            sub_s = []
            while stack.last != "("
                sub_s << stack.pop
            end
            stack.pop
            stack.concat(sub_s)
        else
            stack << c
        end
    end
    stack.join
end
