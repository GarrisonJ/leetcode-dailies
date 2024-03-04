# @param {String[]} words
# @return {String}
def first_palindrome(words)
    w = words.find { |x| x == x.reverse }
    w ? w : ""
end
